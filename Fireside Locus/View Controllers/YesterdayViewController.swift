//
//  YesterdayViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 6/21/22.
//

import UIKit
import RVS_AutofillTextField

protocol YesterdayDelegate {
    func updateYesterdayShifts(counselorOne: Counselor, counselorTwo: Counselor)
}

class YesterdayViewController: UIViewController, RVS_AutofillTextFieldDelegate, RVS_AutofillTextFieldDataSource, UITextFieldDelegate {

    @IBOutlet var counselorOne: RVS_AutofillTextField!
    @IBOutlet var counselorTwo: RVS_AutofillTextField!
    
    var delegate: YesterdayDelegate?
    var textDictionary: [RVS_AutofillTextFieldDataSourceType] = []
    
    var masterCounselorList: [Counselor]? {
        didSet {
            generateTextDictionary(counselors: masterCounselorList ?? [])
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        let convertedCounselors = convertToCounselor(one: counselorOne.text ?? "", two: counselorTwo.text ?? "")
        delegate?.updateYesterdayShifts(counselorOne: convertedCounselors[0]!, counselorTwo: convertedCounselors[1]!)
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        counselorOne.delegate = self
        counselorOne.dataSource = self
        counselorTwo.delegate = self
        counselorTwo.dataSource = self
        
        counselorOne.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        counselorOne.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        
        counselorTwo.tableFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        counselorTwo.tableBackgroundColor = UIColor(named: "luzerneColor")?.withAlphaComponent(0.92) ?? .systemBackground
        // Do any additional setup after loading the view.
    }
    
    func convertToCounselor(one: String, two: String) -> [Counselor?] {
        let counselorOne: Counselor? = masterCounselorList?.filter { $0.name == one }.first
        let counselorTwo: Counselor? = masterCounselorList?.filter { $0.name == two }.first
        return [counselorOne, counselorTwo]
    }
    
    func generateTextDictionary(counselors: [Counselor]) {
        var ret = [RVS_AutofillTextFieldDataSourceType]()
        for i in counselors {
            ret.append(RVS_AutofillTextFieldDataSourceType(value: i.name))
        }
        textDictionary = ret
    }
    
    func save() {
        let convertedCounselors = convertToCounselor(one: counselorOne.text ?? "", two: counselorTwo.text ?? "")
        delegate?.updateYesterdayShifts(counselorOne: convertedCounselors[0]!, counselorTwo: convertedCounselors[1]!)
        dismiss(animated: true)
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == counselorTwo {
            save()
        }
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
