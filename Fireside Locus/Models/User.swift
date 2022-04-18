//
//  Token.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/13/22.
//

import Foundation

final class User: Codable {
    var name: String
    var isAdmin: Bool = false
    var token: String
    
    
    init(name: String, isAdmin: Bool, token: String) {
        self.name = name
        self.isAdmin = isAdmin
        self.token = token
    }
}
