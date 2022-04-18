//
//  ScheduledEvent.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/8/22.
//

import Foundation

struct ScheduledEvent: Codable {
    var title: String
    var eventLocation: String
    var startTime: String
    var endTime: String
    var attendee: [String]
    var id: Int
    
    init(title: String, eventLocation: String, startTime: String, endTime: String, attendee: [String], id: Int) {
        self.title = title
        self.eventLocation = eventLocation
        self.startTime = startTime
        self.endTime = endTime
        self.attendee = attendee
        self.id = id
    }
}
