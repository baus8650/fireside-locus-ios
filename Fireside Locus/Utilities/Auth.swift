//
//  Auth.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/13/22.
//

import Foundation
import UIKit

enum AuthResult {
  case success
  case failure
}

class Auth {
  static let keychainKey = "FIRESIDELOCUS-API-KEY"

  var token: String? {
    get {
      Keychain.load(key: Auth.keychainKey)
    }
    set {
      if let newToken = newValue {
        Keychain.save(key: Auth.keychainKey, data: newToken)
      } else {
        Keychain.delete(key: Auth.keychainKey)
      }
    }
  }

  func logout() {
    token = nil
    DispatchQueue.main.async {
        let scene = UIApplication.shared.connectedScenes.first
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            
          let rootController =
            UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginNavigation")
          sceneDelegate.window?.rootViewController = rootController
        }
        
    }
  }

  func login(username: String, password: String, completion: @escaping (AuthResult) -> Void) {
      let body = ["username": username, "password": password]
      let jsonBody = try? JSONSerialization.data(withJSONObject: body)

      var request = URLRequest(url: URL(string: "https://firesidelocus.herokuapp.com/api/users/login/")!,timeoutInterval: Double.infinity)
      request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      request.httpMethod = "POST"
      request.httpBody = jsonBody
      
      let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
              print(String(describing: error))
              return
          }
          do {
              let token = try JSONDecoder().decode(Token.self, from: data)
              self.token = token.token
              completion(.success)
          } catch {
              completion(.failure)
          }
      }
      
      task.resume()
      
  }
}
