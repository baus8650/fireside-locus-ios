//
//  ChooseTwoTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/28/22.
//

import UIKit

protocol UpdateTwoShiftDelegate {
    func updateTwoShifts(choiceOne: String, choiceTwo: String, cancel: Bool, indexPath: IndexPath)
}

class ChooseTwoTableViewController: UITableViewController, UITextFieldDelegate {

    var isCanceled: Bool = false
    var updateTwoShiftDelegate: UpdateTwoShiftDelegate?
    var selectedIndexPath: IndexPath?
    
    @IBOutlet var choiceOne: UITextField!
    @IBOutlet var choiceTwo: UITextField!
    
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
    
    func save() {
        updateTwoShiftDelegate?.updateTwoShifts(choiceOne: choiceOne.text ?? "", choiceTwo: choiceTwo.text ?? "", cancel: isCanceled, indexPath: selectedIndexPath!)
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        choiceOne.delegate = self
        choiceTwo.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
