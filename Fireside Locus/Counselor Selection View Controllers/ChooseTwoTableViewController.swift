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
            print("IN OFF LIST DIDSET BEFORE FILTERING \(self.offList?.count)")
            self.masterCounselorList = filterDaysOff(daysOff: self.offList ?? [], counselors: self.masterCounselorList ?? [])
            print("IN OFF LIST DIDSET \(self.masterCounselorList)")
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
        print("in the filter \(counselors)")
        let filteredCounselors = counselors.filter { counselor in
            return !daysOff.contains(where: { off in
                return counselor.name == off.name
            })
        }
        print("JUST FILTERED \(filteredCounselors.count)")
        return filteredCounselors
    }
    
    func save() {
        let convertedCounselors = convertToCounselor(one: choiceOne.text ?? editOne, two: choiceTwo.text ?? editTwo)
        if selectedIndexPath!.section == 6 {
            print("IN SAVE IN TWO",convertedCounselors)
            updateTwoShiftDelegate?.updateCounselorsDaysOff(counselors: [convertedCounselors[0] ?? nil, convertedCounselors[1] ?? nil], selectedIndexPath: selectedIndexPath!)
        }
        
        updateTwoShiftDelegate?.updateTwoShifts(choiceOne: convertedCounselors[0] ?? nil, choiceTwo: convertedCounselors[1] ?? nil, cancel: isCanceled, indexPath: selectedIndexPath!)
//        if choiceOne.text == "" && choiceTwo.text == "" {
//            updateTwoShiftDelegate?.updateTwoCounselorList(counselors: allCounselors!, selectedIndexPath: selectedIndexPath!)
//        } else {
        print("Saving from choose two \(masterCounselorList?.count)")
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

        print("IN CHECK SELECTION TWO MASTER LIST COUNT \(masterCounselorList?.count)")
        masterCounselorList = referenceList
        print("IN CHECK SELECTION TWO RESET TO REFERENCE MASTER LIST COUNT \(masterCounselorList?.count)")
        if selectedIndexPath!.section == 6 {
            
//            var newOffList = [Counselor?]()
            var counselorOne: Counselor?
            var counselorTwo: Counselor?
            if choiceOne.text == "" && choiceTwo.text == "" {
                print("IN THAT FANCY NEW BLOCK HERE IS THE OFF LIST \(offList)")
            } else {
                if choiceOne.text != "" {
                    counselorOne = allCounselors?.filter { $0.name == choiceOne.text }.first
                }
                if choiceTwo.text != "" {
                    counselorOne = allCounselors?.filter { $0.name == choiceTwo.text }.first
                }
            }
            var localList = [counselorOne, counselorTwo]
            
//            newOffList = localList.compactMap( { $0 })
            print("IN THAT FANCY NEW BLOCK HERE IS THE OFF LIST BEFORE APPENDING TO MASTER LIST \(offList) AND MASTER LIST HAS COUNT OF \(masterCounselorList?.count)")
            for i in offList! {
                masterCounselorList!.append(i)
                referenceList!.append(i)
            }
            print("SHOULD HAVE APPENDED FOR FANCY \(masterCounselorList?.count)")
//            offList = []
            offList = localList.compactMap( { $0 })
            print("HERE IS THE NEW OFF LIST \(offList)")
            
        }
        masterCounselorList = filterDaysOff(daysOff: offList ?? [], counselors: masterCounselorList ?? [])
        print("FILTER FOR DAYS OFF, DAYS OFF COUNT \(offList?.count) AND MASTER LIST COUNT \(masterCounselorList?.count)")
        if choiceOne.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceOne.text }
        }
        if choiceTwo.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceTwo.text }
        }
        print("AT THE VERY END MASTER COUNT \(masterCounselorList?.count)")
        
    }
    
    func autoFillTextField(_ autofillTextField: RVS_AutofillTextField, selectionWasMade: RVS_AutofillTextFieldDataSourceType) {
        masterCounselorList = masterCounselorList?.filter { $0.name != selectionWasMade.value}
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