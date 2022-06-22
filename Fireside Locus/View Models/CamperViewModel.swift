//
//  CamperViewModel.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/18/22.
//

import CoreData
import Foundation
import UIKit

class CamperViewModel {
    
    let sectionTitles = ["Cabin 1", "Cabin 2", "Cabin 3", "Cabin 4", "Cabin 5", "Cabin 6", "Cabin 7", "Cabin 8", "Cabin 9", "Cabin 10", "Cabin 11", "Cabin 12", "Unassigned"]
    var sections = Binder([String]())
    var context: NSManagedObjectContext!
    var campersCore: Binder<[NSManagedObject]> = Binder([NSManagedObject]())
    var campers: Binder<[[Camper]]> = Binder([[Camper]]())
    var sortedFlattenedCampers: Binder<[Camper]> = Binder([Camper]())
    
    init() {
        setUpCoreData()
        fetchCampers()
    }
    
    func setUpCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func deleteAllCampers() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CamperModel")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(batchDeleteRequest)
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    
    func fetchCampers() {
        Auth().fetchCampers()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CamperModel")
        do {
            self.campersCore.value = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        sortCampers()
    }
    
    func sortCampers() {
        campers.value = []
        var unsortedCampers = [Camper]()
        for camper in campersCore.value {
            unsortedCampers.append(
                Camper(
                    id: camper.value(forKey: "id") as! Int,
                    firstName: camper.value(forKey: "firstName") as! String,
                    lastName: camper.value(forKey: "lastName") as! String,
                    age: camper.value(forKey: "age") as! Int,
                    instrument: camper.value(forKey: "instrument") as! String,
                    program: camper.value(forKey: "program") as! String,
                    cabin: camper.value(forKey: "cabin") as! String,
                    ensemble: camper.value(forKey: "ensemble") as! String,
                    groups: camper.value(forKey: "groups") as! [String])
                )
        }
        var sortedCampersDict: [String: [Camper]] = [:]
        
        let sortedCampers = unsortedCampers.sorted {
            $0.firstName < $1.firstName
        }
        sortedFlattenedCampers.value = sortedCampers
        for i in sortedCampers {
            switch i.cabin! {
            case "Cabin 1":
                sortedCampersDict["Cabin 1", default: []].append(i)
            case "Cabin 2":
                sortedCampersDict["Cabin 2", default: []].append(i)
            case "Cabin 3":
                sortedCampersDict["Cabin 3", default: []].append(i)
            case "Cabin 4":
                sortedCampersDict["Cabin 4", default: []].append(i)
            case "Cabin 5":
                sortedCampersDict["Cabin 5", default: []].append(i)
            case "Cabin 6":
                sortedCampersDict["Cabin 6", default: []].append(i)
            case "Cabin 7":
                sortedCampersDict["Cabin 7", default: []].append(i)
            case "Cabin 8":
                sortedCampersDict["Cabin 8", default: []].append(i)
            case "Cabin 9":
                sortedCampersDict["Cabin 9", default: []].append(i)
            case "Cabin 10":
                sortedCampersDict["Cabin 10", default: []].append(i)
            case "Cabin 11":
                sortedCampersDict["Cabin 11", default: []].append(i)
            case "Cabin 12":
                sortedCampersDict["Cabin 12", default: []].append(i)
            default:
                sortedCampersDict["Unassigned", default: []].append(i)
            }
        }
        self.campers.value = []
        self.campers.value = self.buildTableData(camperAssignments: sortedCampersDict, cabinList: self.sectionTitles)
    }
    
    func buildTableData(camperAssignments: [String: [Camper]], cabinList: [String]) -> [[Camper]] {
        var campers = [[Camper]]()
        var emptyCabins = [String]()
        for cabin in cabinList {
            if camperAssignments[cabin] == nil {
                emptyCabins.append(cabin)
            } else {
                campers.append(camperAssignments[cabin]!)
            }
        }
        var filteredSections = [String]()
        if emptyCabins.count > 0 {
            for i in sectionTitles {
                if !emptyCabins.contains(i) {
                    filteredSections.append(i)
                }
            }
            self.sections.value = filteredSections
        }
        return campers
    }
}
