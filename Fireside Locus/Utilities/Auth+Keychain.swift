//
//  Auth+Keychain.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/13/22.
//

import Security
import UIKit

enum Keychain {
  @discardableResult
  static func save(key: String, data: User) -> OSStatus {
//    let bytes: [UInt8] = .init(data.utf8)
      let encoder = JSONEncoder()
//      let encoded = try? encoder.encode(data)
          
    let bytesAsData = try? encoder.encode(data) // Data(bytes)
    let query = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key,
      kSecValueData: bytesAsData as Any
    ] as [CFString: Any]

    SecItemDelete(query as CFDictionary)

    return SecItemAdd(query as CFDictionary, nil)
  }

  @discardableResult
  static func delete(key: String) -> OSStatus {
    let query = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key
    ] as [CFString: Any]

    return SecItemDelete(query as CFDictionary)
  }

  static func load(key: String) -> User? {
    let query = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key,
      kSecReturnData: kCFBooleanTrue as Any,
      kSecMatchLimit: kSecMatchLimitOne
    ] as [CFString: Any]

    var dataTypeRef: AnyObject?

    let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

    if status == noErr {
      guard let data = dataTypeRef as? Data else {
        return nil
      }
        let decoder = JSONDecoder()
        let userData = try? decoder.decode(User.self, from: data)
      return userData // String(decoding: data, as: UTF8.self)
    } else {
      return nil
    }
  }
}
