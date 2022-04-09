//
//  CamperSearchDataSource.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/8/22.
//

import UIKit

class CamperSearchDataSource: NSObject, UITableViewDataSource {
    
    
    var campers = [Camper]()
    var searchResults = [Camper]()
//    var parentViewController: UITableViewController?
    var isSearching: Bool = false
    
    init(campers: [Camper]) {
//        self.parentViewController = viewController
        self.campers = campers
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
                return searchResults.count
            }
            else{

                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CamperScheduleCell", for: indexPath)
        
        if isSearching {
            let camper = searchResults[indexPath.row]
            cell.textLabel?.text = "\(camper.firstName) \(camper.lastName)"
        } else {
            
        }
        
        return cell
    }
}
