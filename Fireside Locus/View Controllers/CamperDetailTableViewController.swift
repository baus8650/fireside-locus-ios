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
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) is not implemented")
    }
    
    init?(coder: NSCoder, camper: Camper) {
      self.camper = camper
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
