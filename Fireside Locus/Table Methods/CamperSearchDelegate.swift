//
//  CamperSearchDelegate.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/8/22.
//

import UIKit

class CamperSearchDelegate: NSCoder, UITableViewDelegate {

    var parentViewController: UITableViewController?
    var isSearching: Bool = false
    var campers = [Camper]()
    
    init(viewController: UITableViewController, campers: [Camper]) {
        self.parentViewController = viewController
        self.campers = campers
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            let parentVC = parentViewController as? ScheduleDetailsTableViewController
            parentVC?.camperSearch = campers[indexPath.row]
            parentVC?.hideKeyboard()
        }
    }
}
