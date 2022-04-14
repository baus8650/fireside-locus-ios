//
//  Token.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/13/22.
//

import Foundation

final class Token: Codable {
  var token: String

  init(token: String) {
    self.token = token
  }
}
