//
//  AdminTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/15/22.
//

import CoreData
import UIKit

class AdminTableViewController: UITableViewController {
    
    var sections = [String]()
    
    var rows = [[String]]()
    
    var context: NSManagedObjectContext!
    
    var camperViewModel: CamperViewModel?
    var counselorViewModel: CounselorViewModel?
//    var eventViewModel: EventViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetUp()
        
        tableView.reloadData()
        title = "Settings"
        
        camperViewModel = CamperViewModel()
        counselorViewModel = CounselorViewModel()
//        eventViewModel = EventViewModel
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func tableSetUp() {
        if Auth().user?.isAdmin == true {
            rows = [["Counselor Schedules"], ["Rosters"], ["Reset Campers", "Reset Events", "Reset Counselors"], ["Account"], ["Log Out"]]
            sections = ["Create", "Reference", "Data", "Settings", ""]
        } else {
            rows = [["Rosters"], ["Reset Campers", "Reset Events"], ["Account"], ["Log Out"]]
            sections = ["Reference", "Data", "Settings", ""]
        }
//        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rows[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminCell", for: indexPath)

        cell.textLabel?.text = rows[indexPath.section][indexPath.row]
        switch Auth().user?.isAdmin {
        case true:
            if indexPath.section == 2 {
                cell.textLabel?.textColor = .red
            } else if indexPath.section == 4 {
                cell.textLabel?.textColor = UIColor(named: "luzerneColor")
            }
        default:
            if indexPath.section == 1 {
                cell.textLabel?.textColor = .red
            } else if indexPath.section == 3 {
                cell.textLabel?.textColor = UIColor(named: "luzerneColor")
            }
        }

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Auth().user?.isAdmin {
        case true:
            if indexPath.section == 2 {
                switch indexPath.row {
                case 0:
                    let ac = UIAlertController(title: "Reset Request", message: "Are you sure you want to reset all campers? This will remove all campers from your device and redownload the most updated versions from the website. This action cannot be undone.", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Continue", style: .destructive, handler: { (action) -> Void in
                        self.resetCampers()
                    }))
                    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    present(ac, animated: true)
                case 1:
                    let ac = UIAlertController(title: "Reset Request", message: "Are you sure you want to reset all events? This will remove all events from your device and redownload the most updated versions from the website. This action cannot be undone.", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Continue", style: .destructive, handler: { (action) -> Void in
                        self.resetEvents()
                    }))
                    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    present(ac, animated: true)
                case 2:
                    let ac = UIAlertController(title: "Reset Request", message: "Are you sure you want to reset all counselors? This will remove all counselors from your device and redownload the most updated versions from the website. This action cannot be undone.", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Continue", style: .destructive, handler: { (action) -> Void in
                        self.resetCounselors()
                    }))
                    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    present(ac, animated: true)
                default:
                    print(indexPath.row)
                }
            }
            if indexPath.section == 4 {
                Auth().logout()
            }
        default:
            if indexPath.section == 1 {
                switch indexPath.row {
                case 0:
                    let ac = UIAlertController(title: "Reset Request", message: "Are you sure you want to reset all campers? This will remove all campers from your device and redownload the most updated versions from the website. This action cannot be undone.", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Continue", style: .destructive, handler: { (action) -> Void in
                        self.resetCampers()
                    }))
                    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    present(ac, animated: true)
                case 1:
                    let ac = UIAlertController(title: "Reset Request", message: "Are you sure you want to reset all events? This will remove all events from your device and redownload the most updated versions from the website. This action cannot be undone.", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Continue", style: .destructive, handler: { (action) -> Void in
                        self.resetEvents()
                    }))
                    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    present(ac, animated: true)
                default:
                    print(indexPath.row)
                }
            }
            if indexPath.section == 3 {
                Auth().logout()
            }
        }
        
        
    }
    
    func resetCampers() {
        camperViewModel?.deleteAllCampers()
        camperViewModel?.fetchCampers()
    }
    
    func resetEvents() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ScheduledEventModel")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(batchDeleteRequest)
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
        Auth().fetchEvents()
    }
    
    
    func resetCounselors() {
        counselorViewModel?.deleteAllCounselors()
        counselorViewModel?.fetchCounselors()
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
