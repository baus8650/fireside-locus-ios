//
//  ChooseTwoTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/28/22.
//

import UIKit
import RVS_AutofillTextField

protocol UpdateTwoShiftDelegate {
    func updateTwoShifts(choiceOne: Counselor?, choiceTwo: Counselor?, cancel: Bool, indexPath: IndexPath)
    func updateTwoCounselorList(counselors: [Counselor], selectedIndexPath: IndexPath)
    func updateCounselorsDaysOff(counselors: [Counselor?], selectedIndexPath: IndexPath)
    func updateNightWatch(counselors: [Counselor?], selectedIndexPath: IndexPath)
}

class ChooseTwoTableViewController: UITableViewController, UITextFieldDelegate, RVS_AutofillTextFieldDataSource, RVS_AutofillTextFieldDelegate {

    var textDictionary: [RVS_AutofillTextFieldDataSourceType] = []
    
    var isCanceled: Bool = false
    var updateTwoShiftDelegate: UpdateTwoShiftDelegate?
    var selectedIndexPath: IndexPath?
    
    var editOne: String = ""
    var editTwo: String = ""
    
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
        let convertedCounselors = convertToCounselor(one: choiceOne.text ?? editOne, two: choiceTwo.text ?? editTwo)
        if selectedIndexPath!.section == 6 {
            updateTwoShiftDelegate?.updateCounselorsDaysOff(counselors: [convertedCounselors[0] ?? nil, convertedCounselors[1] ?? nil], selectedIndexPath: selectedIndexPath!)
        } else if selectedIndexPath!.section == 5 {
            updateTwoShiftDelegate?.updateNightWatch(counselors: [convertedCounselors[0] ?? nil, convertedCounselors[1] ?? nil], selectedIndexPath: selectedIndexPath!)
        }
        
        updateTwoShiftDelegate?.updateTwoShifts(choiceOne: convertedCounselors[0] ?? nil, choiceTwo: convertedCounselors[1] ?? nil, cancel: isCanceled, indexPath: selectedIndexPath!)
//        if choiceOne.text == "" && choiceTwo.text == "" {
//            updateTwoShiftDelegate?.updateTwoCounselorList(counselors: allCounselors!, selectedIndexPath: selectedIndexPath!)
//        } else {
            updateTwoShiftDelegate?.updateTwoCounselorList(counselors: masterCounselorList!, selectedIndexPath: selectedIndexPath!)
//        }
        dismiss(animated: true)
    }
    
    func convertToCounselor(one: String, two: String) -> [Counselor?] {
        let counselorOne: Counselor? = allCounselors?.filter { $0.name == one }.first
        let counselorTwo: Counselor? = allCounselors?.filter { $0.name == two }.first
        return [counselorOne, counselorTwo]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choiceOne.text = editOne
        choiceTwo.text = editTwo

        choiceOne.delegate = self
        choiceOne.dataSource = self
        choiceTwo.delegate = self
        choiceTwo.dataSource = self
        
        choiceOne.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceOne.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        
        choiceTwo.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceTwo.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        

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
        if selectedIndexPath!.section == 6 {
            var counselorOne: Counselor?
            var counselorTwo: Counselor?
            
//            if choiceOne.text == "" && choiceTwo.text == "" {
//            } else {
                if choiceOne.text != "" {
                    counselorOne = allCounselors?.filter { $0.name == choiceOne.text }.first
                }
                if choiceTwo.text != "" {
                    counselorOne = allCounselors?.filter { $0.name == choiceTwo.text }.first
                }
//            }
            var localList = [counselorOne, counselorTwo]
            
            for i in offList ?? [] {
                masterCounselorList!.append(i)
                referenceList!.append(i)
            }
            offList = localList.compactMap( { $0 })
            
//        } else if selectedIndexPath!.section == 5 {
//            var counselorOne: Counselor?
//            var counselorTwo: Counselor?
//
//            if choiceOne.text != "" {
//                counselorOne = allCounselors?.filter { $0.name == choiceOne.text }.first
//            } else {
//                counselorOne = allCounselors?.filter { $0.name == editOne }.first
//            }
//            if choiceTwo.text != "" {
//                counselorTwo = allCounselors?.filter { $0.name == choiceTwo.text }.first
//            } else {
//                counselorTwo = allCounselors?.filter { $0.name == editTwo }.first
//            }
//
//            var localList = [counselorOne, counselorTwo]
            
        } else {
            
            var counselorOne: Counselor?
            var counselorTwo: Counselor?

//            if choiceOne.text == "" && choiceTwo.text == "" {
//            } else {
                if choiceOne.text != "" {
                    counselorOne = allCounselors?.filter { $0.name == choiceOne.text }.first
                } else {
                    counselorOne = allCounselors?.filter { $0.name == editOne }.first
                }
                if choiceTwo.text != "" {
                    counselorTwo = allCounselors?.filter { $0.name == choiceTwo.text }.first
                } else {
                    counselorTwo = allCounselors?.filter { $0.name == editTwo }.first
                }
//            }
            var localList = [counselorOne, counselorTwo]
            for i in localList {
                if i != nil {
                    masterCounselorList!.append(i!)
                    referenceList!.append(i!)
                }
            }
            var referenceSet = Set(referenceList!)
            referenceList = Array(referenceSet)
            var masterSet = Set(masterCounselorList!)
            masterCounselorList = Array(masterSet)
            
            
            
        }
        masterCounselorList = filterDaysOff(daysOff: offList ?? [], counselors: masterCounselorList ?? [])
        if choiceOne.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceOne.text }
        }
        if choiceTwo.text != "" {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
