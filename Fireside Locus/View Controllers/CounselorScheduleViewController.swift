//
//  CounselorScheduleViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/20/22.
//

import UIKit

class CounselorScheduleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    let margin: CGFloat = 1
    
    let titleLabels = ["","8:30 – 12:00", "12:30 – 4:00", "6:30 – Cabin In", "Evening Activity", "Nightwatch", "Day Off", "MOT", "Activity", "Arts & Crafts/North Village", "South Village", "Beach", "Store", "North Practice Cabins", "South Practice Cabins", "Roam"]
    
    let days = ["Sunday", "Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var masterList: [[Shift]]?
    var shiftViewModel: ShiftViewModel? 
    var selectedIndexPath: IndexPath?
    var counselorViewModel: CounselorViewModel?
    var counselors: [Counselor]?
    
    var sundaySupervisionList: [Counselor]?
    var sundayRecList: [Counselor]?
    var mondaySupervisionList: [Counselor]?
    var mondayRecList: [Counselor]?
    var tuesdaySupervisionList: [Counselor]?
    var tuesdayRecList: [Counselor]?
    var wednesdaySupervisionList: [Counselor]?
    var wednesdayRecList: [Counselor]?
    var thursdaySupervisionList: [Counselor]?
    var thursdayRecList: [Counselor]?
    var fridaySupervisionList: [Counselor]?
    var fridayRecList: [Counselor]?
    var saturdaySupervisionList: [Counselor]?
    var saturdayRecList: [Counselor]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 17
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as! DayCollectionViewCell
            cell.dayTitle.text = days[indexPath.row]
//            cell.dayTitle.textColor = .black
//            cell.backgroundColor = .white
            return cell
        } else if indexPath.section == 1 || indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourCell", for: indexPath) as! FourCollectionViewCell
            if indexPath.section == 1 {
//                cell.backgroundColor = .white
                cell.timeTitle.text = titleLabels[indexPath.section]
//                cell.timeTitle.textColor = .black
                cell.positionOneTitle.text = "Basketball Court"
                cell.positionTwoTitle.text = "North Practice Village"
                cell.positionThreeTitle.text = "South Practice Village"
                cell.positionFourTitle.text = "Tent 3"
//                cell.positionOneTitle.textColor = .black
//                cell.positionTwoTitle.textColor = .black
//                cell.positionThreeTitle.textColor = .black
//                cell.positionFourTitle.textColor = .black
                
                cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
                cell.counselorTwo.text = masterList?[indexPath.row][indexPath.section].counselors[1]?.name ?? ""
                cell.counselorThree.text = masterList?[indexPath.row][indexPath.section].counselors[2]?.name ?? ""
                cell.counselorFour.text = masterList?[indexPath.row][indexPath.section].counselors[3]?.name ?? ""
                
                return cell
            } else {
//                cell.backgroundColor = .white
                cell.timeTitle.text = titleLabels[indexPath.section]
//                cell.timeTitle.textColor = .black
                cell.positionOneTitle.text = "Basketball Court"
                cell.positionTwoTitle.text = "North Practice Village"
                cell.positionThreeTitle.text = "South Practice Village"
                cell.positionFourTitle.text = "Tent 3"
//                cell.positionOneTitle.textColor = .black
//                cell.positionTwoTitle.textColor = .black
//                cell.positionThreeTitle.textColor = .black
//                cell.positionFourTitle.textColor = .black
                cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
                cell.counselorTwo.text = masterList?[indexPath.row][indexPath.section].counselors[1]?.name ?? ""
                cell.counselorThree.text = masterList?[indexPath.row][indexPath.section].counselors[2]?.name ?? ""
                cell.counselorFour.text = masterList?[indexPath.row][indexPath.section].counselors[3]?.name ?? ""
                return cell
            }
        } else if indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5 || indexPath.section == 6 || indexPath.section == 11 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoCell", for: indexPath) as! TwoCollectionViewCell
            if indexPath.section == 3 {
//                cell.backgroundColor = .white
                cell.titleLabel.text = titleLabels[indexPath.section]
//                cell.titleLabel.textColor = .black
                cell.positionOneLabel.text = "North Village"
                cell.positionTwoLabel.text = "South Village"
//                cell.positionOneLabel.textColor = .black
//                cell.positionTwoLabel.textColor = .black
                cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
                cell.counselorTwo.text = masterList?[indexPath.row][indexPath.section].counselors[1]?.name ?? ""
                return cell
            } else if indexPath.section == 4 {
//                cell.backgroundColor = .white
                cell.titleLabel.text = titleLabels[indexPath.section]
//                cell.titleLabel.textColor = .black
                cell.positionOneLabel.text = ""
                cell.positionTwoLabel.text = ""
//                cell.positionOneLabel.textColor = .black
//                cell.positionTwoLabel.textColor = .black
                cell.positionOneView.layer.borderWidth = 0
                cell.positionTwoView.layer.borderWidth = 0
                cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
                cell.counselorTwo.text = masterList?[indexPath.row][indexPath.section].counselors[1]?.name ?? ""
                return cell
            } else if indexPath.section == 5 {
//                cell.backgroundColor = .white
                cell.titleLabel.text = titleLabels[indexPath.section]
//                cell.titleLabel.textColor = .black
                cell.positionOneLabel.text = "10:00 PM – 3:00 AM"
                cell.positionTwoLabel.text = "3:00 AM – 8:00 AM"
//                cell.positionOneLabel.textColor = .black
//                cell.positionTwoLabel.textColor = .black
                cell.positionOneView.layer.borderWidth = 1
                cell.positionTwoView.layer.borderWidth = 1
                cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
                cell.counselorTwo.text = masterList?[indexPath.row][indexPath.section].counselors[1]?.name ?? ""
                return cell
            } else if indexPath.section == 6 {
//                cell.backgroundColor = .white
                cell.titleLabel.text = titleLabels[indexPath.section]
//                cell.titleLabel.textColor = .black
                cell.positionOneLabel.text = ""
                cell.positionTwoLabel.text = ""
//                cell.positionOneLabel.textColor = .black
//                cell.positionTwoLabel.textColor = .black
                cell.positionOneView.layer.borderWidth = 0
                cell.positionTwoView.layer.borderWidth = 0
                cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
                cell.counselorTwo.text = masterList?[indexPath.row][indexPath.section].counselors[1]?.name ?? ""
                return cell
            } else {
//                cell.backgroundColor = .white
                cell.titleLabel.text = titleLabels[indexPath.section]
//                cell.titleLabel.textColor = .black
                cell.positionOneLabel.text = ""
//                cell.positionOneLabel.textColor = .black
//                cell.positionTwoLabel.textColor = .black
                cell.positionTwoLabel.text = ""
                cell.positionOneView.layer.borderWidth = 0
                cell.positionTwoView.layer.borderWidth = 0
                cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
                cell.counselorTwo.text = masterList?[indexPath.row][indexPath.section].counselors[1]?.name ?? ""
                return cell
            }
        } else if indexPath.section == 16 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConcertCell", for: indexPath) as! ConcertCollectionViewCell
            cell.titleLabel.text = "\(days[indexPath.row]) Concert?"
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneCell", for: indexPath) as! OneCollectionViewCell
//            cell.backgroundColor = .white
            cell.positionOneLabel.text = titleLabels[indexPath.section]
//            cell.positionOneLabel.textColor = .black
            cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
            return cell
        }
    
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
          return CGSize(width: 180, height: 30)
        } else if indexPath.section == 1 || indexPath.section == 2 {
            return CGSize(width: 180, height: 260)
        } else if indexPath.section == 3 || indexPath.section == 4 ||  indexPath.section == 5 || indexPath.section == 6 || indexPath.section == 11 {
            return CGSize(width: 180, height: 160)
        } else {
            return CGSize(width: 180, height: 60)
        }

        }
    
    @IBOutlet var counselorTable: UICollectionView!
    var populateButton: UIBarButtonItem!
    var printButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        counselorTable.dataSource = self
        counselorTable.delegate = self
        shiftViewModel = ShiftViewModel()
        counselorViewModel = CounselorViewModel()
        populateButton = UIBarButtonItem(title: "Populate", style: .plain, target: self, action: #selector(populateTable))
        printButton = UIBarButtonItem(title: "Print", style: .plain, target: self, action: #selector(printSchedule))
        printButton.isEnabled = false
        navigationItem.rightBarButtonItems = [printButton, populateButton]
        updateData()
        // Do any additional setup after loading the view.
    }
    
    func updateData() {
        counselorViewModel?.counselorList.bind(listener: { counselor in
            self.counselors = counselor
            self.sundaySupervisionList = counselor
            self.sundayRecList = counselor
            self.mondaySupervisionList = counselor
            self.mondayRecList = counselor
            self.tuesdaySupervisionList = counselor
            self.tuesdayRecList = counselor
            self.wednesdaySupervisionList = counselor
            self.wednesdayRecList = counselor
            self.thursdaySupervisionList = counselor
            self.thursdayRecList = counselor
            self.fridaySupervisionList = counselor
            self.fridayRecList = counselor
            self.saturdaySupervisionList = counselor
            self.saturdayRecList = counselor
//            print(counselor)
        })
    }
    
    @objc
    func populateTable() {
        printButton.isEnabled = true
    }
    
    @objc
    func printSchedule() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 || indexPath.section == 2 {
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "FourChoice", sender: nil)
        } else if indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5 || indexPath.section == 6 || indexPath.section == 11 {
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "TwoChoice", sender: nil)
        } else {
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "SingleChoice", sender: nil)
        }
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FourChoice" {
            let destVC = segue.destination as! ChooseFourTableViewController
            destVC.selectedIndexPath = selectedIndexPath
            switch selectedIndexPath?.row {
            case 0:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = sundaySupervisionList
                } else {
                    destVC.masterCounselorList = sundayRecList
                }
            case 1:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = mondaySupervisionList
                } else {
                    destVC.masterCounselorList = mondayRecList
                }
            case 2:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = tuesdaySupervisionList
                } else {
                    destVC.masterCounselorList = tuesdayRecList
                }
            case 3:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = wednesdaySupervisionList
                } else {
                    destVC.masterCounselorList = wednesdayRecList
                }
            case 4:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = thursdaySupervisionList
                } else {
                    destVC.masterCounselorList = thursdayRecList
                }
            case 5:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = fridaySupervisionList
                } else {
                    destVC.masterCounselorList = fridayRecList
                }
            case 6:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = saturdaySupervisionList
                } else {
                    destVC.masterCounselorList = saturdayRecList
                }
            default:
                print("No day specification")
            }
            destVC.allCounselors = counselors
            destVC.editOne = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[0]?.name ?? ""
            destVC.editTwo = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[1]?.name ?? ""
            destVC.editThree = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[2]?.name ?? ""
            destVC.editFour = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[3]?.name ?? ""
            destVC.updateFourShiftsDelegate = self
            
        } else if segue.identifier == "TwoChoice" {
            let destVC = segue.destination as! ChooseTwoTableViewController
            destVC.selectedIndexPath = selectedIndexPath
            destVC.updateTwoShiftDelegate = self
        } else if segue.identifier == "SingleChoice" {
            let destVC = segue.destination as! ChooseOneTableViewController
            destVC.selectedIndexPath = selectedIndexPath
            destVC.updateDelegate = self
        }
    }
    
    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//            let noOfCellsInRow = 7
//            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//
//            let leftInset = flowLayout.sectionInset.left
//            let rightInset = flowLayout.sectionInset.right
//            let minimumSpacing = flowLayout.minimumInteritemSpacing
//
//            let totalSpace = leftInset + rightInset + (minimumSpacing * CGFloat(noOfCellsInRow - 1))
//
//            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
//
//            return CGSize(width: size, height: size)
//
//        }

}

extension CounselorScheduleViewController: UpdateFourShiftDelegate {
    func updateFourShifts(choiceOne: Counselor?, choiceTwo: Counselor?, choiceThree: Counselor?, choiceFour: Counselor?, cancel: Bool, indexPath: IndexPath) {
        if cancel == false {
            let localList = [choiceOne ?? nil, choiceTwo ?? nil, choiceThree ?? nil, choiceFour ?? nil]
            print("index path = ",indexPath)
            shiftViewModel?.insertCounselors(indexPath: indexPath, counselors: localList)
            shiftViewModel?.masterList.bind(listener: { shifts in
                self.masterList = shifts
            })
            print("Here's the master list: \(shiftViewModel?.masterList.value)")
        } else {
            print("cancelled")
        }
        self.counselorTable.reloadData()
    }
    
    func updateCounselorList(counselors: [Counselor], selectedIndexPath: IndexPath) {
        print("UPDATING LIST \(selectedIndexPath.row), counselors: \(counselors)")
        switch selectedIndexPath.row {
        case 0:
            if selectedIndexPath.section <= 3 {
                self.sundaySupervisionList = counselors
            } else {
                self.sundayRecList = counselors
            }
        case 1:
            if selectedIndexPath.section <= 3 {
                self.mondaySupervisionList = counselors
            } else {
                self.mondayRecList = counselors
            }
        case 2:
            if selectedIndexPath.section <= 3 {
                self.tuesdaySupervisionList = counselors
            } else {
                self.tuesdayRecList = counselors
            }
        case 3:
            if selectedIndexPath.section <= 3 {
                self.wednesdaySupervisionList = counselors
            } else {
                self.wednesdayRecList = counselors
            }
        case 4:
            if selectedIndexPath.section <= 3 {
                self.thursdaySupervisionList = counselors
            } else {
                self.thursdayRecList = counselors
            }
        case 5:
            if selectedIndexPath.section <= 3 {
                self.fridaySupervisionList = counselors
            } else {
                self.fridayRecList = counselors
            }
        case 6:
            if selectedIndexPath.section <= 3 {
                self.saturdaySupervisionList = counselors
            } else {
                self.saturdayRecList = counselors
            }
        default:
            print("No day specification")
        }
    }
    
    
}

extension CounselorScheduleViewController: UpdateTwoShiftDelegate {
    func updateTwoShifts(choiceOne: Counselor?, choiceTwo: Counselor?, cancel: Bool, indexPath: IndexPath) {
        if cancel == false {
            let localList = [choiceOne ?? nil, choiceTwo ?? nil]
            shiftViewModel?.insertCounselors(indexPath: indexPath, counselors: localList)
            shiftViewModel?.masterList.bind(listener: { shifts in
                self.masterList = shifts
            })
        } else {
            print("cancelled")
        }
        self.counselorTable.reloadData()
    }
    
}

extension CounselorScheduleViewController: UpdateOneShiftDelegate {
    func updateOneShift(counselor: Counselor?, cancel: Bool, indexPath: IndexPath) {
        if cancel == false {
            let localList = [counselor]
            shiftViewModel?.insertCounselors(indexPath: indexPath, counselors: localList)
            shiftViewModel?.masterList.bind(listener: { shifts in
                self.masterList = shifts
            })
        } else {
            print("cancelled")
        }
        self.counselorTable.reloadData()
    }
    
}

