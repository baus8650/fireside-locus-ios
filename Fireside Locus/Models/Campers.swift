//
//  Camper.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/7/22.
//

import Foundation

struct Campers: Codable {
    var campers: [Camper]
}

struct Camper: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var age: Int
    var instrument: String
    var program: String
    var cabin: String?
    var ensemble: String
    var groups: [String]
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case cycle
        case appID = "app_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case age
        case instrument
        case program
        case cabin
        case ensemble
        case groups = "group"
    }
    
    init(
        id: Int,
        firstName: String,
        lastName: String,
        age: Int,
        instrument: String,
        program: String,
        cabin: String,
        ensemble: String,
        groups: [String]
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.instrument = instrument
        self.program = program
        self.cabin = cabin
        self.ensemble = ensemble
        self.groups = groups
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        age = try values.decode(Int.self, forKey: .age)
        instrument = try values.decode(String.self, forKey: .instrument)
        program = try values.decode(String.self, forKey: .program)
        cabin = try values.decode(String?.self, forKey: .cabin) ?? ""
        ensemble = try values.decode(String.self, forKey: .ensemble)
        groups = try values.decode([String].self, forKey: .groups)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(age, forKey: .age)
        try container.encode(instrument, forKey: .instrument)
        try container.encode(program, forKey: .program)
        try container.encode(cabin, forKey: .cabin)
        try container.encode(ensemble, forKey: .ensemble)
        try container.encode(groups, forKey: .groups)
    }
    
}
