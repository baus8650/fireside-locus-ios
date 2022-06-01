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
    
    var concertList = [0,0,0,0,0,0,0]
    
    var masterList: [[Shift]]?
    var shiftViewModel: ShiftViewModel? 
    var selectedIndexPath: IndexPath?
    var counselorViewModel: CounselorViewModel?
    var counselors: [Counselor]?
    
    var sundaySupervisionList: [Counselor]?
    var sundayRecList: [Counselor]?
    var sundayOffList: [Counselor]?
    var sundayNightWatch: [Counselor]?
    
    var mondaySupervisionList: [Counselor]?
    var mondayRecList: [Counselor]?
    var mondayOffList: [Counselor]?
    var mondayNightWatch: [Counselor]?
    
    var tuesdaySupervisionList: [Counselor]?
    var tuesdayRecList: [Counselor]?
    var tuesdayOffList: [Counselor]?
    var tuesdayNightWatch: [Counselor]?
    
    var wednesdaySupervisionList: [Counselor]?
    var wednesdayRecList: [Counselor]?
    var wednesdayOffList: [Counselor]?
    var wednesdayNightWatch: [Counselor]?
    
    var thursdaySupervisionList: [Counselor]?
    var thursdayRecList: [Counselor]?
    var thursdayOffList: [Counselor]?
    var thursdayNightWatch: [Counselor]?
    
    var fridaySupervisionList: [Counselor]?
    var fridayRecList: [Counselor]?
    var fridayOffList: [Counselor]?
    var fridayNightWatch: [Counselor]?
    
    var saturdaySupervisionList: [Counselor]?
    var saturdayRecList: [Counselor]?
    var saturdayOffList: [Counselor]?
    var saturdayNightWatch: [Counselor]?
    
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
        } else if indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5 || indexPath.section == 11 {
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
        } else if indexPath.section == 6 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThreeCell", for: indexPath) as! ThreeCollectionViewCell
            
            cell.titleLabel.text = titleLabels[indexPath.section]
            //                cell.titleLabel.textColor = .black
            //                cell.positionOneLabel.textColor = .black
            //                cell.positionTwoLabel.textColor = .black
            cell.viewOne.layer.borderWidth = 0
            cell.viewTwo.layer.borderWidth = 0
            cell.viewThree.layer.borderWidth = 0
            cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""
            cell.counselorTwo.text = masterList?[indexPath.row][indexPath.section].counselors[1]?.name ?? ""
            cell.counselorThree.text = masterList?[indexPath.row][indexPath.section].counselors[2]?.name ?? ""
            return cell
        } else if indexPath.section == 16 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConcertCell", for: indexPath) as! ConcertCollectionViewCell
            cell.titleLabel.text = "\(days[indexPath.row]) Concert?"
            cell.concertSelector.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
            
            // set the tag property of your segmented control to uniquely identify each segmented control in the value change event
            cell.concertSelector.tag = indexPath.row
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
    
    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.tag {
        case 0:
            concertList[sender.tag] = sender.selectedSegmentIndex
        case 1:
            concertList[sender.tag] = sender.selectedSegmentIndex
        case 2:
            concertList[sender.tag] = sender.selectedSegmentIndex
        case 3:
            concertList[sender.tag] = sender.selectedSegmentIndex
        case 4:
            concertList[sender.tag] = sender.selectedSegmentIndex
        case 5:
            concertList[sender.tag] = sender.selectedSegmentIndex
        case 6:
            concertList[sender.tag] = sender.selectedSegmentIndex
        default:
            break
        }
        
        print(concertList)
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
        })
        shiftViewModel?.masterList.bind(listener: { shift in
            self.masterList = shift
        })
    }
    
    func passData() {
        shiftViewModel?.sundaySupervisionList = self.sundaySupervisionList
        shiftViewModel?.sundayRecList = self.sundayRecList
        shiftViewModel?.sundayOffList = self.sundayOffList
        shiftViewModel?.sundayNightWatch = self.sundayNightWatch
        
        shiftViewModel?.mondaySupervisionList = self.mondaySupervisionList
        shiftViewModel?.mondayRecList = self.mondayRecList
        shiftViewModel?.mondayOffList = self.mondayOffList
        shiftViewModel?.mondayNightWatch = self.mondayNightWatch
        
        shiftViewModel?.tuesdaySupervisionList = self.tuesdaySupervisionList
        shiftViewModel?.tuesdayRecList = self.tuesdayRecList
        shiftViewModel?.tuesdayOffList = self.tuesdayOffList
        shiftViewModel?.tuesdayNightWatch = self.tuesdayNightWatch
        
        shiftViewModel?.wednesdaySupervisionList = self.wednesdaySupervisionList
        shiftViewModel?.wednesdayRecList = self.wednesdayRecList
        shiftViewModel?.wednesdayOffList = self.wednesdayOffList
        shiftViewModel?.wednesdayNightWatch = self.wednesdayNightWatch
        
        shiftViewModel?.thursdaySupervisionList = self.thursdaySupervisionList
        shiftViewModel?.thursdayRecList = self.thursdayRecList
        shiftViewModel?.thursdayOffList = self.thursdayOffList
        shiftViewModel?.thursdayNightWatch = self.thursdayNightWatch
        
        shiftViewModel?.fridaySupervisionList = self.fridaySupervisionList
        shiftViewModel?.fridayRecList = self.fridayRecList
        shiftViewModel?.fridayOffList = self.fridayOffList
        shiftViewModel?.fridayNightWatch = self.fridayNightWatch
        
        shiftViewModel?.saturdaySupervisionList = self.saturdaySupervisionList
        shiftViewModel?.saturdayRecList = self.saturdayRecList
        shiftViewModel?.saturdayOffList = self.saturdayOffList
        shiftViewModel?.saturdayNightWatch = self.saturdayNightWatch
    }
    
    @objc
    func populateTable() {
        shiftViewModel?.concertList.value = self.concertList
        passData()
        shiftViewModel?.compileSingleLists()
        shiftViewModel?.populateSchedule()
        printButton.isEnabled = true
    }
    
    @objc
    func printSchedule() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 || indexPath.section == 2 {
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "FourChoice", sender: nil)
        } else if indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5 || indexPath.section == 11 {
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "TwoChoice", sender: nil)
        } else if indexPath.section == 6 {
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "DayOffSelect", sender: nil)
        } else {
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "SingleChoice", sender: nil)
        }
    }
    
    func filterDaysOff(daysOff: [Counselor], counselors: [Counselor]) -> [Counselor] {
        let filteredCounselors = counselors.filter { counselor in
            return !daysOff.contains(where: { off in
                return counselor.name == off.name
            })
        }
        return filteredCounselors
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
                    destVC.referenceList = sundaySupervisionList
                } else {
                    destVC.masterCounselorList = sundayRecList
                    destVC.referenceList = sundayRecList
                }
                if selectedIndexPath!.section == 1 {
                    // This is not a mistake. I need to feed the previous day's nightwatch assignment in order to prevent them from being secheduled for a morning shift.
                    destVC.nightWatch = saturdayNightWatch
                }
                destVC.offList = sundayOffList
            case 1:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = mondaySupervisionList
                    destVC.referenceList = mondaySupervisionList
                } else {
                    destVC.masterCounselorList = mondayRecList
                    destVC.referenceList = mondayRecList
                }
                if selectedIndexPath!.section == 1 {
                    // This is not a mistake. I need to feed the previous day's nightwatch assignment in order to prevent them from being secheduled for a morning shift.
                    destVC.nightWatch = sundayNightWatch
                }
                destVC.offList = mondayOffList
            case 2:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = tuesdaySupervisionList
                    destVC.referenceList = tuesdaySupervisionList
                } else {
                    destVC.masterCounselorList = tuesdayRecList
                    destVC.referenceList = tuesdayRecList
                }
                if selectedIndexPath!.section == 1 {
                    // This is not a mistake. I need to feed the previous day's nightwatch assignment in order to prevent them from being secheduled for a morning shift.
                    destVC.nightWatch = mondayNightWatch
                }
                destVC.offList = tuesdayOffList
            case 3:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = wednesdaySupervisionList
                    destVC.referenceList = wednesdaySupervisionList
                } else {
                    destVC.masterCounselorList = wednesdayRecList
                    destVC.referenceList = wednesdayRecList
                }
                if selectedIndexPath!.section == 1 {
                    // This is not a mistake. I need to feed the previous day's nightwatch assignment in order to prevent them from being secheduled for a morning shift.
                    destVC.nightWatch = wednesdayNightWatch
                }
                destVC.offList = tuesdayOffList
            case 4:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = thursdaySupervisionList
                    destVC.referenceList = thursdaySupervisionList
                } else {
                    destVC.masterCounselorList = thursdayRecList
                    destVC.referenceList = thursdayRecList
                }
                if selectedIndexPath!.section == 1 {
                    // This is not a mistake. I need to feed the previous day's nightwatch assignment in order to prevent them from being secheduled for a morning shift.
                    destVC.nightWatch = wednesdayNightWatch
                }
                destVC.offList = thursdayOffList
            case 5:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = fridaySupervisionList
                    destVC.referenceList = fridaySupervisionList
                } else {
                    destVC.masterCounselorList = fridayRecList
                    destVC.referenceList = fridayRecList
                }
                if selectedIndexPath!.section == 1 {
                    // This is not a mistake. I need to feed the previous day's nightwatch assignment in order to prevent them from being secheduled for a morning shift.
                    destVC.nightWatch = thursdayNightWatch
                }
                destVC.offList = fridayOffList
            case 6:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = saturdaySupervisionList
                    destVC.referenceList = saturdaySupervisionList
                } else {
                    destVC.masterCounselorList = saturdayRecList
                    destVC.referenceList = saturdayRecList
                }
                if selectedIndexPath!.section == 1 {
                    // This is not a mistake. I need to feed the previous day's nightwatch assignment in order to prevent them from being secheduled for a morning shift.
                    destVC.nightWatch = fridayNightWatch
                }
                destVC.offList = saturdayOffList
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
            switch selectedIndexPath?.row {
            case 0:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = sundaySupervisionList
                    destVC.referenceList = sundaySupervisionList
                } else {
                    destVC.masterCounselorList = sundayRecList
                    destVC.referenceList = sundayRecList
                }
                destVC.offList = sundayOffList
            case 1:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = mondaySupervisionList
                    destVC.referenceList = mondaySupervisionList
                } else {
                    destVC.masterCounselorList = mondayRecList
                    destVC.referenceList = mondayRecList
                }
                destVC.offList = mondayOffList
            case 2:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = tuesdaySupervisionList
                    destVC.referenceList = tuesdaySupervisionList
                } else {
                    destVC.masterCounselorList = tuesdayRecList
                    destVC.referenceList = tuesdayRecList
                }
                destVC.offList = tuesdayOffList
            case 3:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = wednesdaySupervisionList
                    destVC.referenceList = wednesdaySupervisionList
                } else {
                    destVC.masterCounselorList = wednesdayRecList
                    destVC.referenceList = wednesdayRecList
                }
                destVC.offList = wednesdayOffList
            case 4:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = thursdaySupervisionList
                    destVC.referenceList = thursdaySupervisionList
                } else {
                    destVC.masterCounselorList = thursdayRecList
                    destVC.referenceList = thursdayRecList
                }
                destVC.offList = thursdayOffList
            case 5:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = fridaySupervisionList
                    destVC.referenceList = fridaySupervisionList
                } else {
                    destVC.masterCounselorList = fridayRecList
                    destVC.referenceList = fridayRecList
                }
                destVC.offList = fridayOffList
            case 6:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = saturdaySupervisionList
                    destVC.referenceList = saturdaySupervisionList
                } else {
                    destVC.masterCounselorList = saturdayRecList
                    destVC.referenceList = saturdayRecList
                }
                destVC.offList = saturdayOffList
            default:
                print("No day specification")
            }
            destVC.allCounselors = counselors
            destVC.editOne = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[0]?.name ?? ""
            destVC.editTwo = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[1]?.name ?? ""
        } else if segue.identifier == "SingleChoice" {
            let destVC = segue.destination as! ChooseOneTableViewController
            destVC.selectedIndexPath = selectedIndexPath
            switch selectedIndexPath?.row {
            case 0:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = sundaySupervisionList
                    destVC.referenceList = sundaySupervisionList
                } else {
                    destVC.masterCounselorList = sundayRecList
                    destVC.referenceList = sundayRecList
                }
                destVC.offList = sundayOffList
            case 1:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = mondaySupervisionList
                    destVC.referenceList = mondaySupervisionList
                } else {
                    destVC.masterCounselorList = mondayRecList
                    destVC.referenceList = mondayRecList
                }
                destVC.offList = mondayOffList
            case 2:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = tuesdaySupervisionList
                    destVC.referenceList = tuesdaySupervisionList
                } else {
                    destVC.masterCounselorList = tuesdayRecList
                    destVC.referenceList = tuesdayRecList
                }
                destVC.offList = tuesdayOffList
            case 3:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = wednesdaySupervisionList
                    destVC.referenceList = wednesdaySupervisionList
                } else {
                    destVC.masterCounselorList = wednesdayRecList
                    destVC.referenceList = wednesdayRecList
                }
                destVC.offList = wednesdayOffList
            case 4:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = thursdaySupervisionList
                    destVC.referenceList = thursdaySupervisionList
                } else {
                    destVC.masterCounselorList = thursdayRecList
                    destVC.referenceList = thursdayRecList
                }
                destVC.offList = thursdayOffList
            case 5:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = fridaySupervisionList
                    destVC.referenceList = fridaySupervisionList
                } else {
                    destVC.masterCounselorList = fridayRecList
                    destVC.referenceList = fridayRecList
                }
                destVC.offList = fridayOffList
            case 6:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = saturdaySupervisionList
                    destVC.referenceList = saturdaySupervisionList
                } else {
                    destVC.masterCounselorList = saturdayRecList
                    destVC.referenceList = saturdayRecList
                }
                destVC.offList = saturdayOffList
            default:
                print("No day specification")
            }
            destVC.allCounselors = counselors
            destVC.editOne = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[0]?.name ?? ""
            destVC.updateDelegate = self
        } else if segue.identifier == "DayOffSelect" {
            let destVC = segue.destination as! DayOffTableViewController
            destVC.selectedIndexPath = selectedIndexPath
            destVC.updateTwoShiftDelegate = self
            var offListCheck = [sundayOffList, mondayOffList, tuesdayOffList, wednesdayOffList, thursdayOffList, fridayOffList, saturdayOffList]
            var compact = offListCheck.compactMap({ $0 })
            var flat = compact.flatMap({$0})
            print("HERES OFF LIST CHECK \(flat)")
            destVC.offListCheck = flat
            switch selectedIndexPath?.row {
            case 0:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = sundaySupervisionList
                    destVC.referenceList = sundaySupervisionList
                } else {
                    destVC.masterCounselorList = sundayRecList
                    destVC.referenceList = sundayRecList
                }
                destVC.offList = sundayOffList
            case 1:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = mondaySupervisionList
                    destVC.referenceList = mondaySupervisionList
                } else {
                    destVC.masterCounselorList = mondayRecList
                    destVC.referenceList = mondayRecList
                }
                destVC.offList = mondayOffList
            case 2:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = tuesdaySupervisionList
                    destVC.referenceList = tuesdaySupervisionList
                } else {
                    destVC.masterCounselorList = tuesdayRecList
                    destVC.referenceList = tuesdayRecList
                }
                destVC.offList = tuesdayOffList
            case 3:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = wednesdaySupervisionList
                    destVC.referenceList = wednesdaySupervisionList
                } else {
                    destVC.masterCounselorList = wednesdayRecList
                    destVC.referenceList = wednesdayRecList
                }
                destVC.offList = wednesdayOffList
            case 4:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = thursdaySupervisionList
                    destVC.referenceList = thursdaySupervisionList
                } else {
                    destVC.masterCounselorList = thursdayRecList
                    destVC.referenceList = thursdayRecList
                }
                destVC.offList = thursdayOffList
            case 5:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = fridaySupervisionList
                    destVC.referenceList = fridaySupervisionList
                } else {
                    destVC.masterCounselorList = fridayRecList
                    destVC.referenceList = fridayRecList
                }
                destVC.offList = fridayOffList
            case 6:
                if selectedIndexPath!.section <= 3 {
                    destVC.masterCounselorList = saturdaySupervisionList
                    destVC.referenceList = saturdaySupervisionList
                } else {
                    destVC.masterCounselorList = saturdayRecList
                    destVC.referenceList = saturdayRecList
                }
                destVC.offList = saturdayOffList
            default:
                print("No day specification")
            }
            destVC.allCounselors = counselors
            destVC.editOne = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[0]?.name ?? ""
            destVC.editTwo = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[1]?.name ?? ""
            destVC.editThree = masterList?[selectedIndexPath!.row][selectedIndexPath!.section].counselors[2]?.name ?? ""
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
    
    func updateTwoCounselorList(counselors: [Counselor], selectedIndexPath: IndexPath) {
//        print("UPDATING LIST \(selectedIndexPath.row), counselors: \(counselors)")
        print("UPDATE TWO HERE IS THE MASTER LIST COUNT \(counselors.count)")
        switch selectedIndexPath.row {
        case 0:
            if selectedIndexPath.section == 6 {
                sundaySupervisionList = counselors
                sundayRecList = counselors
            } else if selectedIndexPath.section <= 3 {
                sundaySupervisionList = counselors
            } else {
                sundayRecList = counselors
            }
            
        case 1:
            if selectedIndexPath.section == 6 {
                mondaySupervisionList = counselors
                mondayRecList = counselors
            } else if selectedIndexPath.section <= 3 {
                self.mondaySupervisionList = counselors
            } else {
                self.mondayRecList = counselors
            }
        case 2:
            if selectedIndexPath.section == 6 {
                tuesdaySupervisionList = counselors
                tuesdayRecList = counselors
            } else if selectedIndexPath.section <= 3 {
                self.tuesdaySupervisionList = counselors
            } else {
                self.tuesdayRecList = counselors
            }
        case 3:
            if selectedIndexPath.section == 6 {
                wednesdaySupervisionList = counselors
                wednesdayRecList = counselors
            } else if selectedIndexPath.section <= 3 {
                self.wednesdaySupervisionList = counselors
            } else {
                self.wednesdayRecList = counselors
            }
        case 4:
            if selectedIndexPath.section == 6 {
                thursdaySupervisionList = counselors
                thursdayRecList = counselors
            } else if selectedIndexPath.section <= 3 {
                self.thursdaySupervisionList = counselors
            } else {
                self.thursdayRecList = counselors
            }
        case 5:
            if selectedIndexPath.section == 6 {
                fridaySupervisionList = counselors
                fridayRecList = counselors
            } else if selectedIndexPath.section <= 3 {
                self.fridaySupervisionList = counselors
            } else {
                self.fridayRecList = counselors
            }
        case 6:
            if selectedIndexPath.section == 6 {
                saturdaySupervisionList = counselors
                saturdayRecList = counselors
            } else if selectedIndexPath.section <= 3 {
                self.saturdaySupervisionList = counselors
            } else {
                self.saturdayRecList = counselors
            }
        default:
            print("No day specification")
        }
    }
    
    func updateCounselorsDaysOff(counselors: [Counselor?], selectedIndexPath: IndexPath) {
        switch selectedIndexPath.row {
        case 0:
            self.sundayOffList = counselors.compactMap { $0 }
        case 1:
            self.mondayOffList = counselors.compactMap { $0 }
        case 2:
            self.tuesdayOffList = counselors.compactMap { $0 }
        case 3:
            self.wednesdayOffList = counselors.compactMap { $0 }
        case 4:
            self.thursdayOffList = counselors.compactMap { $0 }
        case 5:
            self.fridayOffList = counselors.compactMap { $0 }
        case 6:
            self.saturdayOffList = counselors.compactMap { $0 }
        default:
            print("No day specification")
        }
    }
    
    func updateNightWatch(counselors: [Counselor?], selectedIndexPath: IndexPath) {
        switch selectedIndexPath.row {
        case 0:
            self.sundayNightWatch = counselors.compactMap { $0 }
        case 1:
            self.mondayNightWatch = counselors.compactMap { $0 }
        case 2:
            self.tuesdayNightWatch = counselors.compactMap { $0 }
        case 3:
            self.wednesdayNightWatch = counselors.compactMap { $0 }
        case 4:
            self.thursdayNightWatch = counselors.compactMap { $0 }
        case 5:
            self.fridayNightWatch = counselors.compactMap { $0 }
        case 6:
            self.saturdayNightWatch = counselors.compactMap { $0 }
        default:
            print("No day specification")
        }
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
    
    func updateOneCounselorList(counselors: [Counselor], selectedIndexPath: IndexPath) {
        //        print("UPDATING LIST \(selectedIndexPath.row), counselors: \(counselors)")
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

extension CounselorScheduleViewController: UpdateOffShiftDelegate {
    
    func updateThreeShifts(choiceOne: Counselor?, choiceTwo: Counselor?, choiceThree: Counselor?, cancel: Bool, indexPath: IndexPath) {
        if cancel == false {
            let localList = [choiceOne ?? nil, choiceTwo ?? nil, choiceThree ?? nil]
            shiftViewModel?.insertCounselors(indexPath: indexPath, counselors: localList)
            shiftViewModel?.masterList.bind(listener: { shifts in
                self.masterList = shifts
            })
        } else {
            print("cancelled")
        }
        self.counselorTable.reloadData()
    }
    
    func updateOffList(counselors: [Counselor?], selectedIndexPath: IndexPath) {
        switch selectedIndexPath.row {
        case 0:
            self.sundayOffList = counselors.compactMap { $0 }
        case 1:
            self.mondayOffList = counselors.compactMap { $0 }
        case 2:
            self.tuesdayOffList = counselors.compactMap { $0 }
        case 3:
            self.wednesdayOffList = counselors.compactMap { $0 }
        case 4:
            self.thursdayOffList = counselors.compactMap { $0 }
        case 5:
            self.fridayOffList = counselors.compactMap { $0 }
        case 6:
            self.saturdayOffList = counselors.compactMap { $0 }
        default:
            print("No day specification")
        }
    }
}

