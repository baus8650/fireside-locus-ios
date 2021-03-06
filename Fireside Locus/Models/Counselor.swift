//
//  Counselor.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/22/22.
//

import Foundation

struct Counselors: Codable {
    var counselors: [Counselor]
}

struct Counselor: Codable, Hashable {
//    var id: Int
    var name: String
    var cabin: String
    var year: Int
    var instrument: String?
    var nightwatchPreferences: [String]
    var recreationPreferences: [String]
    var roles: [String]
}

extension Counselor: Equatable {
    static func ==(lhs: Counselor, rhs: Counselor) -> Bool {
        return lhs.name == rhs.name && lhs.cabin == rhs.cabin
    }
}
