//
//  PrintSchedulesViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 6/21/22.
//

import UIKit

class PrintSchedulesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    @IBOutlet var supervisionView: UIView!
    @IBOutlet var recreationView: UIView!
    
    
    let supervisionShiftLabels = ["","8:30 – 12:00\nBasketball Court", "8:30 – 12:00\nNorth Practice Village", "8:30 – 12:00\nSouth Practice Village", "8:30 – 12:00\nTent 3", "12:30 – 4:00\nBasketball Court", "12:30 – 4:00\nNorth Practice Village", "12:30 – 4:00\nSouth Practice Village", "12:30 – 4:00\nTent 3", "6:30 – Cabin In\nNorth Village", "6:30 – Cabin In\nSouth Village", "Evening Activity", "10:00 PM – 3:00 AM\nNightwatch", "3:00 AM – 8:00 AM\nNightwatch", "Day Off"]
    let recreationShiftLabels = ["", "MOT", "Activity", "Arts & Crafts/\nNorth Village", "South Village", "Beach", "Camp Store", "North Practice Cabins", "South Practice Cabins", "Roam"]
    
    let dayLabels = ["","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    
    var supervisionCounselors = [
        [""],
        ["","","","","","","","","","","","","","","",""],
        ["","","","","","","","","","","","","","","",""],
        ["","","","","","","","","","","","","","","",""],
        ["","","","","","","","","","","","","","","",""],
        ["","","","","","","","","","","","","","","",""],
        ["","","","","","","","","","","","","","","",""],
        ["","","","","","","","","","","","","","","",""]
    ]
    
    var recreationCounselors = [
        [""],
        ["","","","","","","","","",""],
        ["","","","","","","","","",""],
        ["","","","","","","","","",""],
        ["","","","","","","","","",""],
        ["","","","","","","","","",""],
        ["","","","","","","","","",""],
        ["","","","","","","","","",""]
    ]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == supervisionSchedule {
            return 15
        } else {
            return 10
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == supervisionSchedule {
            switch indexPath.row {
            case 0:
                switch indexPath.section {
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "blankCollectionCell", for: indexPath) as! BlankCollectionViewCell
                    
                    return cell
                case 11:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eveningActivityShift", for: indexPath) as! EveningActivityShiftCollectionViewCell
                    cell.eveningActivityShift.text = supervisionShiftLabels[indexPath.section]
                    cell.layer.borderWidth = 1
                    return cell
                case 14:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "doubleShift", for: indexPath) as! DoubleShiftCollectionViewCell
                    cell.doubleShiftLabel.text = supervisionShiftLabels[indexPath.section]
                    cell.layer.borderWidth = 1
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftCell", for: indexPath) as! ShiftCollectionViewCell
                    cell.shiftLabel.text = supervisionShiftLabels[indexPath.section]
                    cell.layer.borderWidth = 1
                    return cell
                }
            default:
                switch indexPath.section {
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayLabelCell", for: indexPath) as! DayLabelCollectionViewCell
                    cell.dayLabel.text = dayLabels[indexPath.row]
                    cell.layer.borderWidth = 1
                    return cell
                case 11:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eveningActivity", for: indexPath) as! EveningActivityCollectionViewCell
                    cell.layer.borderWidth = 1
                    return cell
                case 14:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counselorDouble", for: indexPath) as! CounselorDoubleCollectionViewCell
                    cell.layer.borderWidth = 1
                    cell.counselorOne.delegate = self
                    cell.counselorTwo.delegate = self
                    cell.counselorOne.text = supervisionCounselors[indexPath.row][indexPath.section]
                    cell.counselorTwo.text = supervisionCounselors[indexPath.row][indexPath.section + 1]
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counselorSingle", for: indexPath) as! CounselorSingleCollectionViewCell
                    cell.layer.borderWidth = 1
                    cell.counselor.delegate = self
                    cell.counselor.text = supervisionCounselors[indexPath.row][indexPath.section]
                    return cell
                }
            }
        } else {
            switch indexPath.row {
            case 0:
                switch indexPath.section {
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "blankCollectionCell", for: indexPath) as! RecBlankCollectionViewCell
                    
                    return cell
                case 5:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "doubleShift", for: indexPath) as! RecDoubleShiftCollectionViewCell
                    cell.doubleShift.text = recreationShiftLabels[indexPath.section]
                    cell.layer.borderWidth = 1
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftCell", for: indexPath) as! RecShiftCollectionViewCell
                    cell.shiftLabel.text = recreationShiftLabels[indexPath.section]
                    cell.layer.borderWidth = 1
                    return cell
                }
            default:
                switch indexPath.section {
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayLabelCell", for: indexPath) as! RecDayLableCollectionViewCell
                    cell.dayLabel.text = dayLabels[indexPath.row]
                    cell.layer.borderWidth = 1
                    return cell
                case 5:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counselorDouble", for: indexPath) as! RecCounselorDoubleCollectionViewCell
                    cell.counselorOne.delegate = self
                    cell.counselorTwo.delegate = self
                    cell.counselorOne.text = recreationCounselors[indexPath.row][indexPath.section]
                    cell.counselorTwo.text = recreationCounselors[indexPath.row][indexPath.section + 1]
                    cell.layer.borderWidth = 1
                    return cell
                case 6:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counselorSingle", for: indexPath) as! RecCounselorSingleCollectionViewCell
                    cell.counselor.delegate = self
                    cell.counselor.text = recreationCounselors[indexPath.row][indexPath.section + 1]
                    cell.layer.borderWidth = 1
                    return cell
                case 7:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counselorSingle", for: indexPath) as! RecCounselorSingleCollectionViewCell
                    cell.counselor.delegate = self
                    cell.counselor.text = recreationCounselors[indexPath.row][indexPath.section + 1]
                    cell.layer.borderWidth = 1
                    return cell
                case 8:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counselorSingle", for: indexPath) as! RecCounselorSingleCollectionViewCell
                    cell.counselor.delegate = self
                    cell.counselor.text = recreationCounselors[indexPath.row][indexPath.section + 1]
                    cell.layer.borderWidth = 1
                    return cell
                case 9:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counselorSingle", for: indexPath) as! RecCounselorSingleCollectionViewCell
                    cell.counselor.delegate = self
                    cell.counselor.text = recreationCounselors[indexPath.row][indexPath.section + 1]
                    cell.layer.borderWidth = 1
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counselorSingle", for: indexPath) as! RecCounselorSingleCollectionViewCell
                    cell.counselor.delegate = self
                    cell.counselor.text = recreationCounselors[indexPath.row][indexPath.section]
                    cell.layer.borderWidth = 1
                    return cell
                }
            }
        }
    }
    
    
    @IBOutlet var supervisionSchedule: UICollectionView!
    @IBOutlet var recreationSchedule: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        supervisionSchedule.delegate = self
        supervisionSchedule.dataSource = self
        recreationSchedule.delegate = self
        recreationSchedule.dataSource = self
        supervisionSchedule.reloadData()
        recreationSchedule.reloadData()
        supervisionSchedule.keyboardDismissMode = .onDrag
        recreationSchedule.keyboardDismissMode = .onDrag
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Print", style: .plain, target: self, action: #selector(printPDF))
        // Do any additional setup after loading the view.
    }
    
    @objc
    func printPDF() {
        let image1 = supervisionView.asImage()
        let image2 = recreationView.asImage()
        
        let pdfCreator = PDFCreator(image1: image1, image2: image2)
        let pdfData = pdfCreator.makePDF()
        let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
        if UIDevice.current.userInterfaceIdiom == .pad {
            vc.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
            vc.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: 300, height: 350)
            vc.popoverPresentationController?.permittedArrowDirections = [.left]
        }
        present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == supervisionSchedule {
            switch indexPath.row {
            case 0:
                switch indexPath.section {
                
                case 11:
                    return CGSize(width: 188, height: 150)
                case 14:
                    return CGSize(width: 188, height: 100)
                default:
                    return CGSize(width: 188, height: 50)
                }
            default:
                switch indexPath.section {
                case 11:
                    return CGSize(width: 140, height: 150)
                case 14:
                    return CGSize(width: 140, height: 100)
                default:
                    return CGSize(width: 140, height: 50)
                }
            }
        } else {
            switch indexPath.row {
            case 0:
                switch indexPath.section {
                case 0:
                    return CGSize(width: 188, height: 30)
                case 5:
                    return CGSize(width: 188, height: 100)
                default:
                    return CGSize(width: 188, height: 50)
                }
            default:
                switch indexPath.section {
                case 5:
                    return CGSize(width: 140, height: 100)
                default:
                    return CGSize(width: 140, height: 50)
                }
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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
