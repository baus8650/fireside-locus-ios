//
//  CamperDetailTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/7/22.
//

import UIKit

class CamperDetailTableViewController: UITableViewController {
    
    var camper: Camper {
        didSet {
            updateCamperView()
        }
    }
    
    var campers: [Camper]?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
    
    init?(coder: NSCoder, camper: Camper, campers: [Camper]) {
        self.camper = camper
        self.campers = campers
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getCamperData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCamperData()
    }
    
    func getCamperData() {
//        guard let id = camper.id else {
//            return
//        }
    }
    
    func updateCamperView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @IBSegueAction func filteredCampersSegue(_ coder: NSCoder) -> FilteredCamperTableViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        guard let campers = self.campers else { return nil }
        var sectionLabel: [String]
        var filterValue: String
        switch indexPath.section {
        case 0:
            sectionLabel = ["First Name"]
            filterValue = camper.firstName
        case 1:
            sectionLabel = ["Last Name"]
            filterValue = camper.lastName
        case 2:
            sectionLabel = ["Age"]
            filterValue = "\(camper.age)"
        case 3:
            sectionLabel = ["Instrument"]
            filterValue = camper.instrument
        case 4:
            sectionLabel = ["Cabin"]
            filterValue = camper.cabin ?? ""
        case 5:
            sectionLabel = ["Ensemble"]
            filterValue = camper.ensemble
        case 6:
            sectionLabel = ["Groups"]
            filterValue = camper.groups[indexPath.row]
        default:
            sectionLabel = ["unknown"]
            filterValue = ""
        }
        return FilteredCamperTableViewController(coder: coder, campers: campers, sectionLabel: sectionLabel, filterValue: filterValue)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 6 ? camper.groups.count : 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CamperDetailCell", for: indexPath)

        switch indexPath.section {
        case 0:
            cell.textLabel?.text = camper.firstName
        case 1:
            cell.textLabel?.text = camper.lastName
        case 2:
            cell.textLabel?.text = "\(camper.age)"
        case 3:
            cell.textLabel?.text = camper.instrument
        case 4:
            cell.textLabel?.text = camper.cabin
        case 5:
            cell.textLabel?.text = camper.ensemble
        case 6:
            cell.textLabel?.text = camper.groups[indexPath.row]
        default:
            cell.textLabel?.text = "Unknown"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "First Name"
        case 1:
            return "Last Name"
        case 2:
            return "Age"
        case 3:
            return "Instrument"
        case 4:
            return "Cabin"
        case 5:
            return "Ensemble"
        case 6:
            return "Groups"
        default:
            return "unknown"
        }
    }

}
