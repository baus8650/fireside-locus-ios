//
//  CampersTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/7/22.
//

import UIKit

class CampersTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    var camperViewModel: CamperViewModel!
    
    var campers = [[Camper]]()
    var sortedCampers = [Camper]()
    var searchCampers = [Camper]()
    var sections = [String]()
    
    var isSearching: Bool = false

    @IBOutlet var searchBar: UISearchBar!
    
    @IBSegueAction func makeCamperDetailTableViewController(_ coder: NSCoder) -> CamperDetailTableViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return nil
        }
        var camper: Camper
        if isSearching {
            camper = searchCampers[indexPath.row]
        } else {
            camper = campers[indexPath.section][indexPath.row]
        }
        return CamperDetailTableViewController(coder: coder, camper: camper, campers: self.sortedCampers)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        camperViewModel = CamperViewModel()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        configureRefreshControl()
        tableView.reloadData()
        searchBar.delegate = self
        tableView.keyboardDismissMode = .onDrag
        if Auth().user?.isAdmin == true {
            
        } else {
            tabBarController?.viewControllers?.remove(at: 2)
            tabBarController?.viewControllers?.remove(at: 2)
        }
        updateData()
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.leftBarButtonItem = logoutButton
    }
    
    // MARK: - Helper Functions
    
    func updateData() {
        
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
        
        camperViewModel.campers.bind { campers in
            self.campers = campers
        }
        
        camperViewModel.sortedFlattenedCampers.bind { campers in
            self.sortedCampers = campers
        }
        
        camperViewModel.sections.bind { sections in
            self.sections = sections
        }
    }
    
    @objc func logout() {
        Auth().logout()
    }
    
    func configureRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        camperViewModel.fetchCampers()
        updateData()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching {
            return 1
        } else {
            return sections.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearching {
            return "Search Results"
        } else {
            return sections[section]
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor(named: "luzerneColor")
        header.textLabel?.text = header.textLabel?.text?.capitalized
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        header.textLabel?.frame = header.bounds
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchCampers.count
        } else {
            return campers[section].count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CamperCell", for: indexPath)
        let camper: Camper
        if isSearching {
            camper = searchCampers[indexPath.row]
        } else {
            camper = campers[indexPath.section][indexPath.row]
        }
        
        cell.textLabel?.text = "\(camper.firstName) \(camper.lastName)"
        cell.detailTextLabel?.text = camper.instrument
        
        return cell
    }
    
    // MARK: - Delegate Methods
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let schedule = UIContextualAction(style: .normal, title: "Schedule") { (contextualAction, view, boolValue)  in
            
            let destVC = self.parent?.tabBarController?.viewControllers![1] as! UINavigationController
            destVC.popToRootViewController(animated: true)
            let scheduleVC = destVC.topViewController as! ScheduleDetailsTableViewController
            
            if scheduleVC.isViewLoaded {
                scheduleVC.camperSearch = self.campers[indexPath.section][indexPath.row]
                self.parent?.tabBarController?.selectedIndex = 1
            } else{
                let _ = scheduleVC.view
                scheduleVC.camperSearch = self.campers[indexPath.section][indexPath.row]
                self.parent?.tabBarController?.selectedIndex = 1
            }
        }
        
        let today = UIContextualAction(style: .normal, title: "Today") { (contextualAction, view, boolValue)  in
            
            let destVC = self.parent?.tabBarController?.viewControllers![1] as! UINavigationController
            destVC.popToRootViewController(animated: true)
            let scheduleVC = ScheduleViewController()
            destVC.pushViewController(scheduleVC, animated: true)
            
            if scheduleVC.isViewLoaded {
                scheduleVC.camper = self.campers[indexPath.section][indexPath.row]
                let todayDate = DateFormatter()
                todayDate.dateFormat = "yyy-MM-dd"
                scheduleVC.specifiedDate = todayDate.string(from: Date.now)
                self.parent?.tabBarController?.selectedIndex = 1
            } else{
                let _ = scheduleVC.view
                scheduleVC.camper = self.campers[indexPath.section][indexPath.row]
                let todayDate = DateFormatter()
                todayDate.dateFormat = "yyy-MM-dd"
                scheduleVC.specifiedDate = todayDate.string(from: Date.now)
                self.parent?.tabBarController?.selectedIndex = 1
            }
        }
        today.backgroundColor = UIColor(red: 1/255, green: 85/255, blue: 67/255, alpha: 0.9)
        schedule.backgroundColor = UIColor(red: 205/255, green: 153/255, blue: 18/255, alpha: 0.9)
        
        let swipeActions = UISwipeActionsConfiguration(actions: [schedule, today])
        
        return swipeActions
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            isSearching = false
            searchCampers = sortedCampers
            tableView.reloadData()
        } else {
            isSearching = true
            searchCampers = sortedCampers.filter {
                $0.firstName.lowercased().contains(searchText.lowercased()) || $0.lastName.lowercased().contains(searchText.lowercased()) || "\($0.firstName.lowercased()) \($0.lastName.lowercased())".contains(searchText.lowercased())
            }

            tableView.reloadData()
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
