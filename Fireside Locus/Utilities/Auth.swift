//
//  Auth.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/13/22.
//

import Foundation
import UIKit
import CoreData

enum AuthResult {
    case success
    case failure
}

class Auth {
    static let keychainKey = "FIRESIDELOCUS-API-KEY"
    var context: NSManagedObjectContext!
    var campers = [Camper]()
    var camperRequest = ResourceRequest<Campers>(resourcePath: "campers")
    var events: [ScheduledEvent]?
    var eventRequest = ResourceRequest<[ScheduledEvent]>(resourcePath: "events")
    
    
    var user: User? {
        get {
            Keychain.load(key: Auth.keychainKey)
        }
        set {
            if let newToken = newValue {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(user) {
                    let defaults = UserDefaults.standard
                    defaults.set(encoded, forKey: Auth.keychainKey)
                }
                Keychain.save(key: Auth.keychainKey, data: newToken)
            } else {
                Keychain.delete(key: Auth.keychainKey)
            }
        }
    }
    
    func setUpCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func fetchCampers() {
        camperRequest.getAll { campersResult in
            switch campersResult {
            case .failure:
                print("There was an error fetching Campers")
            case .success(let campers):
                self.saveCampers(campers: campers.campers)
            }
        }
    }
    
    func fetchEvents() {
        eventRequest.getAll { eventsResult in
            switch eventsResult {
            case .failure:
                print("There was an error fetching events.")
            case .success(let events):
                self.saveEvents(events: events)
            }
        }
    }
    
    func saveEvents(events: [ScheduledEvent]) {
        DispatchQueue.main.async(execute: {
        for event in events {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            self.context = appDelegate.persistentContainer.viewContext
            
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ScheduledEventModel")
            fetchRequest.predicate = NSPredicate(format: "id == %@", NSNumber(integerLiteral: event.id))
            
            let results = try? self.context.fetch(fetchRequest)
            
            if results?.count == 0 {
                let savedEntry = NSEntityDescription.insertNewObject(forEntityName: "ScheduledEventModel", into: self.context)
                savedEntry.setValue(event.attendee, forKey: "attendee")
                savedEntry.setValue(event.endTime, forKey: "endTime")
                savedEntry.setValue(event.eventLocation, forKey: "eventLocation")
                savedEntry.setValue(event.startTime, forKey: "startTime")
                savedEntry.setValue(event.title, forKey: "title")
                savedEntry.setValue(event.id, forKey: "id")
            } else {
                let editEvent = results?.first
                editEvent?.setValue(event.attendee, forKey: "attendee")
                editEvent?.setValue(event.endTime, forKey: "endTime")
                editEvent?.setValue(event.eventLocation, forKey: "eventLocation")
                editEvent?.setValue(event.startTime, forKey: "startTime")
                editEvent?.setValue(event.title, forKey: "title")
                editEvent?.setValue(event.id, forKey: "id")
            }
        }
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        })
    }
    
    func saveCampers(campers: [Camper]) {
        DispatchQueue.main.async(execute: {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            self.context = appDelegate.persistentContainer.viewContext
            for camper in campers {
                
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CamperModel")
                fetchRequest.predicate = NSPredicate(format: "id == %@", NSNumber(integerLiteral: camper.id))
                
                let results = try? self.context.fetch(fetchRequest)
                
                if results?.count == 0 {
                    let savedEntry = NSEntityDescription.insertNewObject(forEntityName: "CamperModel", into: self.context)
                    savedEntry.setValue(camper.age, forKey: "age")
                    savedEntry.setValue(camper.cabin, forKey: "cabin")
                    savedEntry.setValue(camper.program, forKey: "program")
                    savedEntry.setValue(camper.ensemble, forKey: "ensemble")
                    savedEntry.setValue(camper.firstName, forKey: "firstName")
                    savedEntry.setValue(camper.groups, forKey: "groups")
                    savedEntry.setValue(camper.id, forKey: "id")
                    savedEntry.setValue(camper.instrument, forKey: "instrument")
                    savedEntry.setValue(camper.lastName, forKey: "lastName")
                } else {
                    let editCamper = results?.first
                    editCamper?.setValue(camper.age, forKey: "age")
                    editCamper?.setValue(camper.cabin, forKey: "cabin")
                    editCamper?.setValue(camper.program, forKey: "program")
                    editCamper?.setValue(camper.ensemble, forKey: "ensemble")
                    editCamper?.setValue(camper.firstName, forKey: "firstName")
                    editCamper?.setValue(camper.groups, forKey: "groups")
                    editCamper?.setValue(camper.id, forKey: "id")
                    editCamper?.setValue(camper.instrument, forKey: "instrument")
                    editCamper?.setValue(camper.lastName, forKey: "lastName")
                }
            }
            do {
                try self.context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        })
    }
    
    
    func logout() {
        user = nil
        DispatchQueue.main.async {
            let scene = UIApplication.shared.connectedScenes.first
            if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                
                let rootController =
                UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginNavigation")
                sceneDelegate.window?.rootViewController = rootController
            }
            
        }
    }
    
    func login(username: String, password: String, completion: @escaping (AuthResult) -> Void) {
        let body = ["username": username, "password": password]
        let jsonBody = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: URL(string: "https://firesidelocus.herokuapp.com/api/users/login/")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                self.user = User(name: user.name, isAdmin: user.isAdmin, token: user.token)
                completion(.success)
            } catch {
                completion(.failure)
            }
        }
        
        task.resume()
        
    }
}
