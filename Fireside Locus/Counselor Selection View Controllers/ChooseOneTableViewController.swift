//
//  ChooseOneTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/29/22.
//

import UIKit
import RVS_AutofillTextField

protocol UpdateOneShiftDelegate {
    func updateOneShift(counselor: Counselor?, cancel: Bool, indexPath: IndexPath)
    func updateOneCounselorList(counselors: [Counselor], selectedIndexPath: IndexPath)
}

class ChooseOneTableViewController: UITableViewController, UITextFieldDelegate, RVS_AutofillTextFieldDataSource, RVS_AutofillTextFieldDelegate {

    var textDictionary: [RVS_AutofillTextFieldDataSourceType] = []
    
    var updateDelegate: UpdateOneShiftDelegate?
    var isCanceled: Bool = false
    var selectedIndexPath: IndexPath?
    
    var editOne: String = ""
    
    var offList: [Counselor]? {
        didSet {
            self.masterCounselorList = filterDaysOff(daysOff: self.offList ?? [], counselors: self.masterCounselorList ?? [])
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
    
    @IBOutlet var counselor: RVS_AutofillTextField!
    @IBOutlet var cancelButton: UISwitch!
    @IBAction func cancelPressed(_ sender: Any) {
        if cancelButton.isOn {
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
        if counselor.text != "" {
            counselorOne = allCounselors?.filter { $0.name == counselor.text }.first
        } else {
            counselorOne = allCounselors?.filter { $0.name == editOne }.first
        }
        var localList = [counselorOne]
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
        
        masterCounselorList = filterDaysOff(daysOff: offList ?? [], counselors: masterCounselorList ?? [])
        if counselor.text != "" {
            masterCounselorList = masterCounselorList?.filter { $0.name != counselor.text }
        }
    }
    
    func convertToCounselor(one: String) -> [Counselor?] {
        let counselorOne: Counselor? = allCounselors?.filter { $0.name == one }.first
        
        return [counselorOne]
    }
    
    func save() {
        let convertedCounselor = convertToCounselor(one: counselor.text ?? "")
        updateDelegate?.updateOneShift(counselor: convertedCounselor[0] ?? nil, cancel: isCanceled, indexPath: selectedIndexPath!)
        updateDelegate?.updateOneCounselorList(counselors: masterCounselorList!, selectedIndexPath: selectedIndexPath!)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counselor.text = editOne
        counselor.delegate = self
        counselor.dataSource = self
        
        counselor.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        counselor.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground

    }
    
    func autoFillTextField(_ autofillTextField: RVS_AutofillTextField, selectionWasMade: RVS_AutofillTextFieldDataSourceType) {
        masterCounselorList = masterCounselorList?.filter { $0.name != selectionWasMade.value}
        autofillTextField.text = selectionWasMade.value
        generateTextDictionary(counselors: masterCounselorList ?? [])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        save()
        return true
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
        return 4
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
