//
//  ScheduleDetailsTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/8/22.
//

import UIKit
import CalendarKit

class ScheduleDetailsTableViewController: UITableViewController, UITextFieldDelegate {
    
    let formatter = DateFormatter()
//    var startDate: Date?
    var selectedDate: String?
    @IBOutlet var weekPicker: UIPickerView!
    @IBOutlet var dayPicker: UIPickerView!
    var campers = [Camper]()
    let campersRequest = ResourceRequest<Campers>(resourcePath: "campers")
    
    var camperSearch: Camper? {
        didSet {
            camperSearchField.text = "\(camperSearch!.firstName) \(camperSearch!.lastName)"
        }
    }
    
    var searchResults = [Camper]()
    
    @IBOutlet var camperSearchTable: UITableView! {
        didSet {
            camperSearchTable.register(UITableViewCell.self, forCellReuseIdentifier: "CamperScheduleCell")
        }
    }
    var isSearching: Bool? {
        didSet {
            if isSearching! {
                camperSearchTable.isHidden = false
                camperSearchDataSource?.isSearching = true
                camperSearchDelegate?.isSearching = true
            } else {
                camperSearchTable.isHidden = true
                camperSearchDataSource?.isSearching = false
                camperSearchDelegate?.isSearching = false
            }
        }
    }
    
    var camperSearchDataSource: CamperSearchDataSource?
    var camperSearchDelegate: CamperSearchDelegate?
    
    @IBOutlet var camperSearchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekPicker.dataSource = self
        weekPicker.delegate = self
        camperSearchDataSource = CamperSearchDataSource(campers: campers)
        camperSearchTable.dataSource = camperSearchDataSource
        camperSearchDelegate = CamperSearchDelegate(viewController: self, campers: campers)
        camperSearchTable.delegate = camperSearchDelegate
        camperSearchField.delegate = self
        getAllCampers()
        formatter.dateFormat = "yyy-MM-dd"
//        startDate = formatter.date(from: "2022-06-19")
    }
    
    func getAllCampers() {
        campersRequest.getAll { [weak self] campersResult in
            switch campersResult {
            case .failure:
                print("There was an error fetching Campers")
            case .success(let campers):
                    self?.campers = campers.campers
            }
        }
    }
    

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
//        case 0:
//        }
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ScheduleDetailsToSchedule" {
            if let destVC = segue.destination as? ScheduleViewController {
                destVC.camper = camperSearch
                let weekNum = weekPicker.selectedRow(inComponent: 0)
                let dayNum = weekPicker.selectedRow(inComponent: 1)
                let startDate = Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 19))
                let newDate = Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 19 + ((weekNum * 7)+dayNum)))
                destVC.specifiedDate = formatter.string(from: newDate!)
                
            }
        }
    }
    

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if textField.tag == 0 {
            var searchText  = textField.text! + string

            if string  == "" {
                searchText = (searchText as String).substring(to: searchText.index(before: searchText.endIndex))
            }

            if searchText == "" {
                isSearching = false
                camperSearchTable.reloadData()
            }
            else{
                getSearchArrayContains(searchText)
            }
            print("SEARCH TEXT: ",searchText)
        }

        return true
    }
    
    func getSearchArrayContains(_ text : String) {
//        var predicate: NSPredicate = NSPredicate(format: "firstName CONTAINS[c] %@", text)
////        print("campers \(campers)")
//        searchResults = (campers as NSArray).filtered(using: predicate) as! [Camper]
        searchResults = campers.filter { $0.firstName.lowercased().contains(text.lowercased()) || $0.lastName.lowercased().contains(text.lowercased()) }
        camperSearchDataSource?.searchResults = searchResults
        camperSearchDelegate?.campers = searchResults
//        print("Search results \(searchResults)")
        isSearching = true
        camperSearchTable.reloadData()
    }
    
}

extension ScheduleDetailsTableViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 8
        } else {
            return 7
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "Week \(row + 1)"
        } else {
            let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            return days[row]
        }
    }
}
