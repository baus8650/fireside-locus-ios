//
//  ChooseOneTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/29/22.
//

import UIKit

protocol UpdateOneShiftDelegate {
    func updateOneShift(counselor: Counselor?, cancel: Bool, indexPath: IndexPath)
}

class ChooseOneTableViewController: UITableViewController, UITextFieldDelegate {

    var updateDelegate: UpdateOneShiftDelegate?
    var isCanceled: Bool = false
    var selectedIndexPath: IndexPath?
    
    var editOne: String = ""
    
    var masterCounselorList: [Counselor]?
    var selectedCounselorList: [Counselor?]?
    
    @IBOutlet var counselor: UITextField!
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
    
    func convertToCounselor(one: String) -> [Counselor?] {
        let counselorOne: Counselor? = masterCounselorList?.filter { $0.name == one }.first
        
        return [counselorOne]
    }
    
    func save() {
        let convertedCounselor = convertToCounselor(one: counselor.text ?? "")
        updateDelegate?.updateOneShift(counselor: convertedCounselor[0] ?? nil, cancel: isCanceled, indexPath: selectedIndexPath!)
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        counselor.text = editOne
        counselor.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        save()
        return true
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
