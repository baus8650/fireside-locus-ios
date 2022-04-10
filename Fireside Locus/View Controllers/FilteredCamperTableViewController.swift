//
//  FilteredCamperTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/10/22.
//

import UIKit

class FilteredCamperTableViewController: UITableViewController {
    
    var section = [String]()
    var camperList: [Camper]? {
        didSet {
            self.campers = filterCampers(campers: camperList ?? [], parameter: section, value: filterValue ?? "")
        }
    }
    var campers: [[Camper]]? {
        didSet {
            tableView.reloadData()
        }
    }
    var filterValue: String?
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    init?(coder: NSCoder, campers: [Camper], sectionLabel: [String], filterValue: String) {
        self.camperList = campers
        self.section = sectionLabel
        self.filterValue = filterValue
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FilterCamperCell")
        self.campers = filterCampers(campers: camperList ?? [], parameter: section, value: filterValue ?? "")
        
    }
    
    func filterCampers(campers: [Camper], parameter: [String], value: String) -> [[Camper]] {
        var filteredCampers = [[Camper]]()
        let localList = campers.filter { camper in
            if camper.cabin != "" {
                switch parameter.first {
                case "First Name":
                    if camper.firstName == value {
                        return true
                    }
                case "Last Name":
                    if camper.lastName == value {
                        return true
                    }
                case "Age":
                    if camper.age == Int(value)! {
                        return true
                    }
                case "Instrument":
                    if camper.instrument == value {
                        return true
                    }
                case "Cabin":
                    if camper.cabin == value {
                        return true
                    }
                case "Ensemble":
                    if camper.ensemble == value {
                        return true
                    }
                case "Groups":
                    if camper.groups.contains(value) {
                        return true
                    }
                default:
                    return false
                }
            }
            return false
        }
        filteredCampers.append(localList)
        return filteredCampers
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return section.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return campers?[section].count ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCamperCell", for: indexPath)

        let camper = campers?[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(camper!.firstName) \(camper!.lastName)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
