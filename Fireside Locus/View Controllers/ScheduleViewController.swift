//
//  ScheduleViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/8/22.
//

import UIKit
import CalendarKit
import EventKit

class ScheduleViewController: DayViewController {

//    var eventStore = EKEventStore()
    
    var camper: Camper? {
        didSet {
            navigationItem.title = "\(camper!.firstName) \(camper!.lastName)'s Schedule"
            navigationController?.navigationBar.barTintColor = .green
        }
    }

    
    var specifiedDate: String? {
        didSet {
            updateDate(date: specifiedDate!)
        }
    }
    
    var filteredEvents = [ScheduledEvent]() {
        didSet{
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    var events = [ScheduledEvent]() {
        didSet{
            filteredEvents = filterEvents(events: events, groups: camper?.groups ?? [])
        }
    }
    let eventRequest = ResourceRequest<[ScheduledEvent]>(resourcePath: "events")
    
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
        
        getAllEvents()
        let todayDate = DateFormatter()
        todayDate.dateFormat = "yyy-MM-dd"
        specifiedDate = todayDate.string(from: Date.now)
//        updateDate(date: specifiedDate!)
        self.reloadData()
        
    }
    
    func updateDate(date: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dayView.move(to: date!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isTranslucent = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.isTranslucent = false
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func getAllEvents() {
        eventRequest.getAll { [weak self] eventsResult in
            switch eventsResult {
            case .failure:
                print("There was an error fetching events.")
            case .success(let events):
                guard let self = self else { return }
                self.events = events
            }
        }
    }
    
    func populateEvents(events: [ScheduledEvent]) {
        
    }
    
    func filterEvents(events: [ScheduledEvent], groups: [String]) -> [ScheduledEvent] {
        let groupsSet = Set(groups)
        let filteredEvents = events.filter({groupsSet.contains($0.attendee.first ?? "")})
        print("Filtered Events \(filteredEvents)")
        return filteredEvents
    }
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
            // The `date` always has it's Time components set to 00:00:00 of the day requested
        
        let startFormatter = DateFormatter()
        startFormatter.dateFormat = "MM/dd/yyyy"
        let startDate = startFormatter.date(from: "08/08/2021")
            var oneDayComponents = DateComponents()
            oneDayComponents.day = 1
            
        let endDate = calendar.date(byAdding: oneDayComponents, to: startDate!)!

        var calendarKitEvents = [Event]()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        for i in filteredEvents {
            let ckEvent = Event()
            ckEvent.text = "\(i.title)\n\(i.eventLocation)"
            ckEvent.dateInterval = DateInterval(start: formatter.date(from: i.startTime)!, end: formatter.date(from: i.endTime)!)
            ckEvent.color = UIColor(red: 1/255, green: 85/255, blue: 67/255, alpha: 0.9)
            calendarKitEvents.append(ckEvent)
        }
        
        return calendarKitEvents
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
