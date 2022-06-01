//
//  DayOffTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 5/31/22.
//

import RVS_AutofillTextField
import UIKit

protocol UpdateOffShiftDelegate {
    func updateThreeShifts(choiceOne: Counselor?, choiceTwo: Counselor?, choiceThree: Counselor?, cancel: Bool, indexPath: IndexPath)
    func updateOffList(counselors: [Counselor?], selectedIndexPath: IndexPath)
}

class DayOffTableViewController: UITableViewController, UITextFieldDelegate, RVS_AutofillTextFieldDataSource, RVS_AutofillTextFieldDelegate {
    
    var textDictionary: [RVS_AutofillTextFieldDataSourceType] = []
    
    var isCanceled: Bool = false
    var updateTwoShiftDelegate: UpdateOffShiftDelegate?
    var selectedIndexPath: IndexPath?
    
    var editOne: String = ""
    var editTwo: String = ""
    var editThree: String = ""
    
    var offListCheck = [Counselor]()
    
    var offList: [Counselor]? {
        didSet {
            self.masterCounselorList = filterDaysOff(daysOff: self.offList ?? [], counselors: self.masterCounselorList ?? [])
        }
    }
    var allCounselors: [Counselor]?
    var referenceList: [Counselor]?
    var masterCounselorList: [Counselor]? {
        didSet {
            generateTextDictionary(counselors: masterCounselorList ?? [])
        }
    }
    var selectedCounselorList: [Counselor?]?
    
    //    var nightWatch: [Counselor]?
    
    @IBOutlet var choiceOne: RVS_AutofillTextField!
    @IBOutlet var choiceTwo: RVS_AutofillTextField!
    @IBOutlet var choiceThree: RVS_AutofillTextField!
    
    @IBOutlet var cancelSwitch: UISwitch!
    @IBAction func cancelPressed(_ sender: Any) {
        if cancelSwitch.isOn {
            isCanceled = true
        } else {
            isCanceled = false
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        save()
    }
    
    func filterDaysOff(daysOff: [Counselor], counselors: [Counselor]) -> [Counselor] {
        let filteredCounselors = counselors.filter { counselor in
            return !daysOff.contains(where: { off in
                return counselor.name == off.name
            })
        }
        return filteredCounselors
    }
    
    func save() {
        let convertedCounselors = convertToCounselor(one: choiceOne.text ?? editOne, two: choiceTwo.text ?? editTwo, three: choiceThree.text ?? editThree)
        let comparison = convertedCounselors.compactMap( {$0} )
        for i in comparison {
            if offListCheck.contains(i) {
                var day = ""
                switch selectedIndexPath!.row {
                case 0:
                    day = "Sunday"
                case 1:
                    day = "Monday"
                case 2:
                    day = "Tuesday"
                case 3:
                    day = "Wednesday"
                case 4:
                    day = "Thursday"
                case 5:
                    day = "Fridayt"
                case 6:
                    day = "Saturday"
                default:
                    day = "Sometime this week"
                }
                let ac = UIAlertController(title: "Assignment Conflict", message: "Oops! Looks like you've already assigned \(i.name)'s day off.", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Okay", style: .default))
                present(ac, animated: true)
            } else {
                if selectedIndexPath!.section == 6 {
                    updateTwoShiftDelegate?.updateOffList(counselors: [convertedCounselors[0] ?? nil, convertedCounselors[1] ?? nil, convertedCounselors[2] ?? nil], selectedIndexPath: selectedIndexPath!)
                } else if selectedIndexPath!.section == 5 {
                    
                }
                
                updateTwoShiftDelegate?.updateThreeShifts(choiceOne: convertedCounselors[0] ?? nil, choiceTwo: convertedCounselors[1] ?? nil, choiceThree: convertedCounselors[2] ?? nil, cancel: isCanceled, indexPath: selectedIndexPath!)
                dismiss(animated: true)
            }
        }
        
    }
    
    func convertToCounselor(one: String, two: String, three: String) -> [Counselor?] {
        let counselorOne: Counselor? = allCounselors?.filter { $0.name == one }.first
        let counselorTwo: Counselor? = allCounselors?.filter { $0.name == two }.first
        let counselorThree: Counselor? = allCounselors?.filter { $0.name == three }.first
        return [counselorOne, counselorTwo, counselorThree]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choiceOne.text = editOne
        choiceTwo.text = editTwo
        choiceThree.text = editThree
        
        choiceOne.delegate = self
        choiceOne.dataSource = self
        choiceTwo.delegate = self
        choiceTwo.dataSource = self
        choiceThree.delegate = self
        choiceThree.dataSource = self
        
        choiceOne.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceOne.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        
        choiceTwo.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceTwo.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        
        choiceThree.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceThree.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        
        
    }
    
    func generateTextDictionary(counselors: [Counselor]) {
        var ret = [RVS_AutofillTextFieldDataSourceType]()
        for i in counselors {
            ret.append(RVS_AutofillTextFieldDataSourceType(value: i.name))
        }
        textDictionary = ret
    }
    
    func checkForSelection() {
        
        masterCounselorList = referenceList
        
        var counselorOne: Counselor?
        var counselorTwo: Counselor?
        var counselorThree: Counselor?
        
        if choiceOne.text != "" {
            counselorOne = allCounselors?.filter { $0.name == choiceOne.text }.first
        }
        if choiceTwo.text != "" {
            counselorTwo = allCounselors?.filter { $0.name == choiceTwo.text }.first
        }
        if choiceThree.text != "" {
            counselorThree = allCounselors?.filter { $0.name == choiceThree.text }.first
        }
        
        var localList = [counselorOne, counselorTwo, counselorThree]
        
        for i in offList ?? [] {
            masterCounselorList!.append(i)
            referenceList!.append(i)
        }
        offList = localList.compactMap( { $0 })
        
        
        masterCounselorList = filterDaysOff(daysOff: offList ?? [], counselors: masterCounselorList ?? [])
        if choiceOne.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceOne.text }
        }
        if choiceTwo.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceTwo.text }
        }
        if choiceThree.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceTwo.text }
        }
        
    }
    
    func autoFillTextField(_ autofillTextField: RVS_AutofillTextField, selectionWasMade: RVS_AutofillTextFieldDataSourceType) {
        if selectedIndexPath!.section == 5 {
            
        } else {
            masterCounselorList = masterCounselorList?.filter { $0.name != selectionWasMade.value}
        }
        autofillTextField.text = selectionWasMade.value
        generateTextDictionary(counselors: masterCounselorList ?? [])
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            checkForSelection()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        save()
        return true
    }
    
}
