//
//  ResourceRequest.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/7/22.
//

import Foundation

enum ResourceRequestError: Error {
    case noData
    case decodingError
    case encodingError
}

struct ResourceRequest<ResourceType> where ResourceType: Codable {
    
    let baseURL = "https://firesidelocus.herokuapp.com/api/"
    let resourceURL: URL
    
    init(resourcePath: String) {
        guard let resourceURL = URL(string: baseURL) else {
            fatalError("Failed to convert baseURL to a URL")
        }
        self.resourceURL =
        resourceURL.appendingPathComponent(resourcePath)
    }
    
    func getAll(completion: @escaping (Result<ResourceType, ResourceRequestError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                
                let resources = try JSONDecoder().decode(ResourceType.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(.success(resources))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }
        dataTask.resume()
    }
    
}
