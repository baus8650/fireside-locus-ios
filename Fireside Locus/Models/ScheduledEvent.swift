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
}
