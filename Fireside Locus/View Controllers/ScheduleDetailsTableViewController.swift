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
    var selectedDate: String?
    
    var campers = [Camper]()
    let campersRequest = ResourceRequest<Campers>(resourcePath: "campers")
    
    var camperSearch: Camper? {
        didSet {
            camperSearchField.text = "\(camperSearch!.firstName) \(camperSearch!.lastName)"
        }
    }
    
    var searchResults = [Camper]()
    
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
    @IBOutlet var weekPicker: UIPickerView!
    @IBOutlet var camperSearchTable: UITableView! {
        didSet {
            camperSearchTable.register(UITableViewCell.self, forCellReuseIdentifier: "CamperScheduleCell")
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
        tableView.keyboardDismissMode = .onDrag
        
    }
    
    func hideKeyboard() {
        view.endEditing(true)
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
            
        }

        return true
    }
    
    func getSearchArrayContains(_ text : String) {
        searchResults = campers.filter { $0.firstName.lowercased().contains(text.lowercased()) || $0.lastName.lowercased().contains(text.lowercased()) }
        
        camperSearchDataSource?.searchResults = searchResults
        camperSearchDelegate?.campers = searchResults
    
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


