//
//  ChooseFourTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/28/22.
//

import UIKit

protocol UpdateFourShiftDelegate {
    func updateFourShifts(choiceOne: String, choiceTwo: String, choiceThree: String, choiceFour: String, cancel: Bool, indexPath: IndexPath)
}

class ChooseFourTableViewController: UITableViewController, UITextFieldDelegate {

    var selectedIndexPath: IndexPath?
    
    var editOne: String = ""
    var editTwo: String = ""
    var editThree: String = ""
    var editFour: String = ""
    
    @IBOutlet var choiceOne: UITextField!
    @IBOutlet var choiceTwo: UITextField!
    @IBOutlet var choiceThree: UITextField!
    @IBOutlet var choiceFour: UITextField!
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
        choiceOne.text = editOne
        choiceTwo.text = editTwo
        choiceThree.text = editThree
        choiceFour.text = editFour
        
        choiceOne.delegate = self
        choiceTwo.delegate = self
        choiceThree.delegate = self
        choiceFour.delegate = self
        
//        selectedIndexPath = IndexPath()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func save() {
        updateFourShiftsDelegate?.updateFourShifts(choiceOne: choiceOne.text ?? "", choiceTwo: choiceTwo.text ?? "", choiceThree: choiceThree.text ?? "", choiceFour: choiceFour.text ?? "", cancel: isCanceled ?? false, indexPath: selectedIndexPath!)
        dismiss(animated: true)
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
