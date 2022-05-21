//
//  ChooseFourTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/28/22.
//

import RVS_AutofillTextField
import UIKit

protocol UpdateFourShiftDelegate {
    func updateFourShifts(choiceOne: Counselor?, choiceTwo: Counselor?, choiceThree: Counselor?, choiceFour: Counselor?, cancel: Bool, indexPath: IndexPath)
    func updateCounselorList(counselors: [Counselor], selectedIndexPath: IndexPath)
}

class ChooseFourTableViewController: UITableViewController, UITextFieldDelegate, RVS_AutofillTextFieldDataSource, RVS_AutofillTextFieldDelegate {
    
    var textDictionary: [RVS_AutofillTextFieldDataSourceType] = []

    var selectedIndexPath: IndexPath?
    
    var editOne: String = ""
    var editTwo: String = ""
    var editThree: String = ""
    var editFour: String = ""
    
    var offList: [Counselor]? {
        didSet {
            print("IN OFF LIST DIDSET BEFORE FILTERING (in choose four) \(self.masterCounselorList)")
            print("ALSO IN FOUR, HERE IS THE OFF LIST FROM DID SET \(self.offList)")
            self.masterCounselorList = filterDaysOff(daysOff: self.offList ?? [], counselors: self.masterCounselorList ?? [])
            print("IN OFF LIST DIDSET \(self.masterCounselorList)")
        }
    }
    var referenceList: [Counselor]?
    var allCounselors: [Counselor]?
    var masterCounselorList: [Counselor]? {
        didSet {
            generateTextDictionary(counselors: masterCounselorList ?? [])
        }
    }
    var selectedCounselorList: [Counselor?]?
    
    @IBOutlet var choiceOne: RVS_AutofillTextField!
    //    @IBOutlet var choiceOne: UITextField!
    @IBOutlet var choiceTwo: RVS_AutofillTextField!
    @IBOutlet var choiceThree: RVS_AutofillTextField!
    @IBOutlet var choiceFour: RVS_AutofillTextField!
    @IBOutlet var cancelSwitch: UISwitch!
    
    @IBAction func switchTouched(_ sender: Any) {
        if cancelSwitch.isOn {
            isCanceled = true
        } else {
            isCanceled = false
        }
    }
    var isCanceled: Bool? = false
    
    var updateFourShiftsDelegate: UpdateFourShiftDelegate?
    
    @IBAction func savePressed(_ sender: Any) {
        save()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        allCounselors = masterCounselorList ?? []
        choiceOne.text = editOne
        choiceTwo.text = editTwo
        choiceThree.text = editThree
        choiceFour.text = editFour
        
        choiceOne.delegate = self
        choiceOne.dataSource = self
        choiceTwo.delegate = self
        choiceTwo.dataSource = self
        choiceThree.delegate = self
        choiceThree.dataSource = self
        choiceFour.delegate = self
        choiceFour.dataSource = self
        choiceOne.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceOne.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        
        choiceTwo.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceTwo.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        
        choiceThree.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceThree.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        
        choiceFour.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choiceFour.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground

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
    
    func generateTextDictionary(counselors: [Counselor]) {
        var ret = [RVS_AutofillTextFieldDataSourceType]()
        for i in counselors {
            ret.append(RVS_AutofillTextFieldDataSourceType(value: i.name))
        }
        textDictionary = ret
    }
    
    func checkForSelection() {
        
        masterCounselorList = referenceList
        masterCounselorList = filterDaysOff(daysOff: offList ?? [], counselors: masterCounselorList ?? [])
        if choiceOne.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceOne.text }
        }
        if choiceTwo.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceTwo.text }
        }
        if choiceThree.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceThree.text }
        }
        if choiceFour.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != choiceFour.text }
        }
            
    }
    
    func autoFillTextField(_ autofillTextField: RVS_AutofillTextField, selectionWasMade: RVS_AutofillTextFieldDataSourceType) {
        masterCounselorList = masterCounselorList?.filter { $0.name != selectionWasMade.value}
        autofillTextField.text = selectionWasMade.value
        generateTextDictionary(counselors: masterCounselorList ?? [])
    }
    
    func save() {
        let convertedCounselors = convertToCounselor(one: choiceOne.text ?? editOne, two: choiceTwo.text ?? editTwo, three: choiceThree.text ?? editThree, four: choiceFour.text ?? editFour)
        
        updateFourShiftsDelegate?.updateFourShifts(choiceOne: convertedCounselors[0] ?? nil, choiceTwo: convertedCounselors[1] ?? nil, choiceThree: convertedCounselors[2] ?? nil, choiceFour: convertedCounselors[3] ?? nil, cancel: isCanceled ?? false, indexPath: selectedIndexPath!)
        updateFourShiftsDelegate?.updateCounselorList(counselors: masterCounselorList!, selectedIndexPath: selectedIndexPath!)
        dismiss(animated: true)
    }

    func convertToCounselor(one: String, two: String, three: String, four: String) -> [Counselor?] {
        print("from convert \(one) and all counselors \(allCounselors)")
        let counselorOne: Counselor? = allCounselors?.filter { $0.name == one }.first
        let counselorTwo: Counselor? = allCounselors?.filter { $0.name == two }.first
        let counselorThree: Counselor? = allCounselors?.filter { $0.name == three }.first
        let counselorFour: Counselor? = allCounselors?.filter { $0.name == four }.first
        print("converted again \(counselorOne)")
        return [counselorOne, counselorTwo, counselorThree, counselorFour]
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            checkForSelection()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
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
