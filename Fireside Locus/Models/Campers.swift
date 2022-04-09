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
    var cycle: String
    var appID: Int
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
    var instrument: String
    var tags: String
    var program: String
    var cabin: String?
    var ensemble: String
//    var chamber: [String]
    var groups: [String]
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case cycle
        case appID = "app_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case age
        case gender
        case instrument
        case tags
        case program
        case cabin
        case ensemble
//        case chamber
        case groups = "group"
    }
    
//    init(
//        id: Int,
//        firstName: String,
//        lastName: String,
//        age: Int,
//        gender: String,
//        instrument: String,
//        tags: String,
//        program: String,
//        cabin: String,
//        ensemble: String,
//        chamber: [String],
//        groups: [String]
//    ) {
//        self.id = id
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//        self.gender = gender
//        self.instrument = instrument
//        self.tags = tags
//        self.program = program
//        self.cabin = cabin
//        self.ensemble = ensemble
//        self.chamber = chamber
//        self.groups = groups
//    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        cycle = try values.decode(String.self, forKey: .cycle)
        appID = try values.decode(Int.self, forKey: .appID)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        age = try values.decode(Int.self, forKey: .age)
        gender = try values.decode(String.self, forKey: .gender)
        instrument = try values.decode(String.self, forKey: .instrument)
        tags = try values.decode(String.self, forKey: .tags)
        program = try values.decode(String.self, forKey: .program)
        cabin = try values.decode(String?.self, forKey: .cabin) ?? ""
        ensemble = try values.decode(String.self, forKey: .ensemble)
//        chamber = try values.decode([String].self, forKey: .chamber)
        groups = try values.decode([String].self, forKey: .groups)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(cycle, forKey: .cycle)
        try container.encode(appID, forKey: .appID)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(age, forKey: .age)
        try container.encode(gender, forKey: .gender)
        try container.encode(instrument, forKey: .instrument)
        try container.encode(tags, forKey: .tags)
        try container.encode(program, forKey: .program)
        try container.encode(cabin, forKey: .cabin)
        try container.encode(ensemble, forKey: .ensemble)
//        try container.encode(chamber, forKey: .chamber)
        try container.encode(groups, forKey: .groups)
    }
    
}
