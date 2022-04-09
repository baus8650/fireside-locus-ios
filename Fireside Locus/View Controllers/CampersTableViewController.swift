//
//  CampersTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/7/22.
//

import UIKit

class CampersTableViewController: UITableViewController {

    // MARK: - Properties
    
    var campers = [Camper]()
    let campersRequest = ResourceRequest<Campers>(resourcePath: "campers")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        configureRefreshControl()
        tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Helper Functions
    
    func configureRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @IBSegueAction func makeCamperDetailTableViewController(_ coder: NSCoder) -> CamperDetailTableViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else {
                return nil
            }
        let camper = campers[indexPath.row]
        return CamperDetailTableViewController(coder: coder, camper: camper)
    }
    
    @objc func handleRefreshControl() {
        campersRequest.getAll { [weak self] campersResult in
            print("getting campers")
            DispatchQueue.main.async {
                self?.tableView.refreshControl?.endRefreshing()
            }
            
            switch campersResult {
            case .failure:
                print("There was an error fetching Campers")
            case .success(let campers):
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    var sortedCampers = campers.campers.sorted {
                        $0.firstName < $1.firstName
                    }
                    self.campers = sortedCampers
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return campers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CamperCell", for: indexPath)

        let camper = campers[indexPath.row]
        cell.textLabel?.text = "\(camper.firstName) \(camper.lastName)"
        cell.detailTextLabel?.text = camper.cabin ?? ""

        return cell
    }
    
    // MARK: - Delegate Methods
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let schedule = UIContextualAction(style: .normal, title: "Schedule") { (contextualAction, view, boolValue)  in
            
            let destVC = self.parent?.tabBarController?.viewControllers![2] as! UINavigationController
            
            let scheduleVC = destVC.topViewController as! ScheduleDetailsTableViewController
            
            if scheduleVC.isViewLoaded {
                scheduleVC.camperSearch = self.campers[indexPath.row]
                self.parent?.tabBarController?.selectedIndex = 2
            } else{
                let _ = scheduleVC.view
                scheduleVC.camperSearch = self.campers[indexPath.row]
//                rowVC.generateMatrix(rowString: row)
//                rowVC.rowTextField.text = row
                self.parent?.tabBarController?.selectedIndex = 2
            }
        }
        
        let today = UIContextualAction(style: .normal, title: "Today") { (contextualAction, view, boolValue)  in
            
            let destVC = self.parent?.tabBarController?.viewControllers![2] as! UINavigationController
            
            let scheduleVC = ScheduleViewController()
            destVC.pushViewController(scheduleVC, animated: true)
//            let scheduleVC = destVC.topViewController as! ScheduleViewController
            
            if scheduleVC.isViewLoaded {
                scheduleVC.camper = self.campers[indexPath.row]
                let todayDate = DateFormatter()
                todayDate.dateFormat = "yyy-MM-dd"
                scheduleVC.specifiedDate = todayDate.string(from: Date.now)
                self.parent?.tabBarController?.selectedIndex = 2
            } else{
                let _ = scheduleVC.view
                scheduleVC.camper = self.campers[indexPath.row]
                let todayDate = DateFormatter()
                todayDate.dateFormat = "yyy-MM-dd"
                scheduleVC.specifiedDate = todayDate.string(from: Date.now)
                self.parent?.tabBarController?.selectedIndex = 2
            }
        }
//        rgba(1,85,67,.9)
        schedule.backgroundColor = UIColor(red: 1/255, green: 85/255, blue: 67/255, alpha: 0.9)
        today.backgroundColor = .systemBlue
        let swipeActions = UISwipeActionsConfiguration(actions: [schedule, today])
        
        return swipeActions
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

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
