//
//  DataStorage.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/16/22.
//

import Foundation
import UIKit

enum CamperResult {
    case success
    case failure
}

class DataStorage {
    
    // MARK: - Camper Data
    
    var campers = [Camper]()
    var camperRequest = ResourceRequest<Campers>(resourcePath: "campers")
    
    func getAllCampers() {
        camperRequest.getAll { campersResult in
            switch campersResult {
            case .failure:
                print("There was an error fetching Campers")
            case .success(let campers):
                self.campers = campers.campers
                
                
            }
        }
    }
    
    // MARK: - Event Data
    
    var events: [ScheduledEvent]?
    var eventRequest = ResourceRequest<[ScheduledEvent]>(resourcePath: "events")
    
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
    
}
