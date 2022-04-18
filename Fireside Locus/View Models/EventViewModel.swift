//
//  EventViewModel.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/18/22.
//

import CoreData
import Foundation
import UIKit

class EventViewModel {
    var context: NSManagedObjectContext!
    var eventsCore = [NSManagedObject]()
    var events: Binder<[ScheduledEvent]> = Binder([ScheduledEvent]())
    var allEvents: Binder<[ScheduledEvent]> = Binder([ScheduledEvent]())

    var camper: Camper?

    init(camper: Camper) {
        self.camper = camper
        setUpCoreData()
        getAllEvents()
    }
    
    func setUpCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func getAllEvents() {
        Auth().fetchEvents()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ScheduledEventModel")
        do {
            eventsCore = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        populateEvents(eventsFromCore: eventsCore)
    }
    
    func populateEvents(eventsFromCore: [NSManagedObject]) {
        self.allEvents.value = []
        for event in eventsFromCore {
            self.allEvents.value.append(
                ScheduledEvent(
                    title: event.value(forKey: "title") as! String,
                    eventLocation: event.value(forKey: "eventLocation") as! String,
                    startTime: event.value(forKey: "startTime") as! String,
                    endTime: event.value(forKey: "endTime") as! String,
                    attendee: event.value(forKey: "attendee") as! [String],
                    id: event.value(forKey: "id") as! Int)
            )
        }
        self.events.value = filterEvents(events: self.allEvents.value, groups: camper?.groups ?? [])
    }
    
    func filterEvents(events: [ScheduledEvent], groups: [String]) -> [ScheduledEvent] {
        let groupsSet = Set(groups)
        let filteredEvents = events.filter({groupsSet.contains($0.attendee.first ?? "")})
        
        return filteredEvents
    }
}
