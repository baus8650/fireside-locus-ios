//
//  ScheduleViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/8/22.
//

import UIKit
import CalendarKit
import CoreData
import EventKit

class ScheduleViewController: DayViewController {
    
    var context: NSManagedObjectContext!
    var eventViewModel: EventViewModel!
    
    var events = [ScheduledEvent]()
    var camper: Camper? {
        didSet {
            eventViewModel = EventViewModel(camper: camper!)
            updateData()
            navigationItem.title = "\(camper!.firstName) \(camper!.lastName)'s Schedule"
            self.reloadData()
        }
    }
    
    var specifiedDate: String? {
        didSet {
            updateDate(date: specifiedDate!)
            self.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        tabAppearance.backgroundColor = .systemBackground
        tabBarController?.tabBar.standardAppearance = tabAppearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabBarController?.tabBar.standardAppearance
        
        
        let todayDate = DateFormatter()
        todayDate.dateFormat = "yyy-MM-dd"
//        self.reloadData()
    }
    
    func updateData() {
        eventViewModel.events.bind { events in
            self.events = events
        }
    }
    
    func updateDate(date: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dayView.move(to: date!)
    }
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        
        let startFormatter = DateFormatter()
        startFormatter.dateFormat = "MM/dd/yyyy"
        var oneDayComponents = DateComponents()
        oneDayComponents.day = 1
        
        var calendarKitEvents = [Event]()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        for i in events {
            let ckEvent = Event()
            ckEvent.text = "\(i.title)\n\(i.eventLocation)"
            ckEvent.dateInterval = DateInterval(start: formatter.date(from: i.startTime)!, end: formatter.date(from: i.endTime)!)
            ckEvent.color = UIColor(named: "luzerneColor") ?? UIColor(named: "default")!
            calendarKitEvents.append(ckEvent)
        }
        
        return calendarKitEvents
        
    }
    
}
