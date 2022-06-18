//
//  CounselorScheduleViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/20/22.
//

import UIKit
import CoreData
import RVS_AutofillTextField

class CounselorScheduleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, RVS_AutofillTextFieldDataSource, RVS_AutofillTextFieldDelegate, UITextFieldDelegate {
    
//    let margin: CGFloat = 1
    
    var textDictionary: [RVS_AutofillTextFieldDataSourceType] = []
    
    let titleLabels = ["","8:30 – 12:00", "12:30 – 4:00", "6:30 – Cabin In", "Evening Activity", "Nightwatch", "Day Off", "MOT", "Activity", "Arts & Crafts/North Village", "South Village", "Beach", "Store", "North Practice Cabins", "South Practice Cabins", "Roam"]
    
    let days = ["Sunday", "Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    let roles = ["Box Office", "Brass TA", "Camp Store", "Front of House", "Head Counselor", "Orchestra Assistant", "Piano TA", "Social Media Assistant", "Stage Manager", "Stage Manager Substitute", "String TA", "Theory TA", "Woodwind TA"]
    
    var counselorNamesSearch = [String]()
    
    var concertList = [0,0,0,0,0,0,0]
    var auditionList = [0,0,0,0,0,0,0]
    
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
    
    var searchTerm: String?
    
//    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchBar: RVS_AutofillTextField!
    
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
                
                let counselorOne = masterList?[indexPath.row][indexPath.section].counselors[0]
                let counselorTwo = masterList?[indexPath.row][indexPath.section].counselors[1]
                let counselorThree = masterList?[indexPath.row][indexPath.section].counselors[2]
                let counselorFour = masterList?[indexPath.row][indexPath.section].counselors[3]
                
                if let searchRoles = counselorOne?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorOne?.name == searchTerm ?? "" {
                        cell.counselorOne.textColor = .red
                    } else {
                        cell.counselorOne.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorTwo?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorTwo?.name == searchTerm ?? "" {
                        cell.counselorTwo.textColor = .red
                    } else {
                        cell.counselorTwo.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorThree?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorThree?.name == searchTerm ?? "" {
                        cell.counselorThree.textColor = .red
                    } else {
                        cell.counselorThree.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorFour?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorFour?.name == searchTerm ?? "" {
                        cell.counselorFour.textColor = .red
                    } else {
                        cell.counselorFour.textColor = UIColor(named: "textColor")
                    }
                }
                
//                if masterList?[indexPath.row][indexPath.section].counselors[0]?.name == searchTerm ?? ""  {
//                    cell.counselorOne.textColor = .red
//                } else {
//                    cell.counselorOne.textColor = UIColor(named: "textColor")
//                }
//
//                if masterList?[indexPath.row][indexPath.section].counselors[1]?.name == searchTerm ?? ""  {
//                    cell.counselorTwo.textColor = .red
//                } else {
//                    cell.counselorTwo.textColor = UIColor(named: "textColor")
//                }
//
//                if masterList?[indexPath.row][indexPath.section].counselors[2]?.name == searchTerm ?? ""  {
//                    cell.counselorThree.textColor = .red
//                } else {
//                    cell.counselorThree.textColor = UIColor(named: "textColor")
//                }
//
//                if masterList?[indexPath.row][indexPath.section].counselors[3]?.name == searchTerm ?? ""  {
//                    cell.counselorFour.textColor = .red
//                } else {
//                    cell.counselorFour.textColor = UIColor(named: "textColor")
//                }
                
                
                
                //|| masterList?[indexPath.row][indexPath.section].counselors[0]?.roles.contains(searchTerm ?? "")
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
                
                let counselorOne = masterList?[indexPath.row][indexPath.section].counselors[0]
                let counselorTwo = masterList?[indexPath.row][indexPath.section].counselors[1]
                let counselorThree = masterList?[indexPath.row][indexPath.section].counselors[2]
                let counselorFour = masterList?[indexPath.row][indexPath.section].counselors[3]
                
                if let searchRoles = counselorOne?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorOne?.name == searchTerm ?? "" {
                        cell.counselorOne.textColor = .red
                    } else {
                        cell.counselorOne.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorTwo?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorTwo?.name == searchTerm ?? "" {
                        cell.counselorTwo.textColor = .red
                    } else {
                        cell.counselorTwo.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorThree?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorThree?.name == searchTerm ?? "" {
                        cell.counselorThree.textColor = .red
                    } else {
                        cell.counselorThree.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorFour?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorFour?.name == searchTerm ?? "" {
                        cell.counselorFour.textColor = .red
                    } else {
                        cell.counselorFour.textColor = UIColor(named: "textColor")
                    }
                }
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
                
                let counselorOne = masterList?[indexPath.row][indexPath.section].counselors[0]
                let counselorTwo = masterList?[indexPath.row][indexPath.section].counselors[1]
                
                if let searchRoles = counselorOne?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorOne?.name == searchTerm ?? "" {
                        cell.counselorOne.textColor = .red
                    } else {
                        cell.counselorOne.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorTwo?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorTwo?.name == searchTerm ?? "" {
                        cell.counselorTwo.textColor = .red
                    } else {
                        cell.counselorTwo.textColor = UIColor(named: "textColor")
                    }
                }
                
            
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
                
                if masterList?[indexPath.row][indexPath.section].counselors[0]?.name == searchTerm ?? ""  {
                    cell.counselorOne.textColor = .red
                } else {
                    cell.counselorOne.textColor = UIColor(named: "textColor")
                }
                
                if masterList?[indexPath.row][indexPath.section].counselors[1]?.name == searchTerm ?? ""  {
                    cell.counselorTwo.textColor = .red
                } else {
                    cell.counselorTwo.textColor = UIColor(named: "textColor")
                }
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
                
                let counselorOne = masterList?[indexPath.row][indexPath.section].counselors[0]
                let counselorTwo = masterList?[indexPath.row][indexPath.section].counselors[1]
                
                if let searchRoles = counselorOne?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorOne?.name == searchTerm ?? "" {
                        cell.counselorOne.textColor = .red
                    } else {
                        cell.counselorOne.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorTwo?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorTwo?.name == searchTerm ?? "" {
                        cell.counselorTwo.textColor = .red
                    } else {
                        cell.counselorTwo.textColor = UIColor(named: "textColor")
                    }
                }
                
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
                
                let counselorOne = masterList?[indexPath.row][indexPath.section].counselors[0]
                let counselorTwo = masterList?[indexPath.row][indexPath.section].counselors[1]
                
                if let searchRoles = counselorOne?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorOne?.name == searchTerm ?? "" {
                        cell.counselorOne.textColor = .red
                    } else {
                        cell.counselorOne.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorTwo?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorTwo?.name == searchTerm ?? "" {
                        cell.counselorTwo.textColor = .red
                    } else {
                        cell.counselorTwo.textColor = UIColor(named: "textColor")
                    }
                }
                
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
                
                let counselorOne = masterList?[indexPath.row][indexPath.section].counselors[0]
                let counselorTwo = masterList?[indexPath.row][indexPath.section].counselors[1]
                
                if let searchRoles = counselorOne?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorOne?.name == searchTerm ?? "" {
                        cell.counselorOne.textColor = .red
                    } else {
                        cell.counselorOne.textColor = UIColor(named: "textColor")
                    }
                }
                
                if let searchRoles = counselorTwo?.roles {
                    if searchRoles.contains(searchTerm ?? "") || counselorTwo?.name == searchTerm ?? "" {
                        cell.counselorTwo.textColor = .red
                    } else {
                        cell.counselorTwo.textColor = UIColor(named: "textColor")
                    }
                }
                
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
            
            let counselorOne = masterList?[indexPath.row][indexPath.section].counselors[0]
            let counselorTwo = masterList?[indexPath.row][indexPath.section].counselors[1]
            let counselorThree = masterList?[indexPath.row][indexPath.section].counselors[2]
            
            if let searchRoles = counselorOne?.roles {
                if searchRoles.contains(searchTerm ?? "") || counselorOne?.name == searchTerm ?? "" {
                    cell.counselorOne.textColor = .red
                } else {
                    cell.counselorOne.textColor = UIColor(named: "textColor")
                }
            }
            
            if let searchRoles = counselorTwo?.roles {
                if searchRoles.contains(searchTerm ?? "") || counselorTwo?.name == searchTerm ?? "" {
                    cell.counselorTwo.textColor = .red
                } else {
                    cell.counselorTwo.textColor = UIColor(named: "textColor")
                }
            }
            
            if let searchRoles = counselorThree?.roles {
                if searchRoles.contains(searchTerm ?? "") || counselorThree?.name == searchTerm ?? "" {
                    cell.counselorThree.textColor = .red
                } else {
                    cell.counselorThree.textColor = UIColor(named: "textColor")
                }
            }
            
            return cell
        } else if indexPath.section == 16 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConcertCell", for: indexPath) as! ConcertCollectionViewCell
//            cell.titleLabel.text = "\(days[indexPath.row]) Day Specifics?"
            switch indexPath.row {
            case 0:
                cell.concertSelector.selectedSegmentIndex = concertList[indexPath.row]
                cell.auditionSelector.selectedSegmentIndex = auditionList[indexPath.row]
            case 1:
                cell.concertSelector.selectedSegmentIndex = concertList[indexPath.row]
                cell.auditionSelector.selectedSegmentIndex = auditionList[indexPath.row]
            case 2:
                cell.concertSelector.selectedSegmentIndex = concertList[indexPath.row]
                cell.auditionSelector.selectedSegmentIndex = auditionList[indexPath.row]
            case 3:
                cell.concertSelector.selectedSegmentIndex = concertList[indexPath.row]
                cell.auditionSelector.selectedSegmentIndex = auditionList[indexPath.row]
            case 4:
                cell.concertSelector.selectedSegmentIndex = concertList[indexPath.row]
                cell.auditionSelector.selectedSegmentIndex = auditionList[indexPath.row]
            case 5:
                cell.concertSelector.selectedSegmentIndex = concertList[indexPath.row]
                cell.auditionSelector.selectedSegmentIndex = auditionList[indexPath.row]
            case 6:
                cell.concertSelector.selectedSegmentIndex = concertList[indexPath.row]
                cell.auditionSelector.selectedSegmentIndex = auditionList[indexPath.row]
            default:
                break
            }
            cell.concertSelector.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
            cell.auditionSelector.addTarget(self, action: #selector(auditionValueChanged(_:)), for: .valueChanged)
            // set the tag property of your segmented control to uniquely identify each segmented control in the value change event
            cell.concertSelector.tag = indexPath.row
            cell.auditionSelector.tag = indexPath.row
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneCell", for: indexPath) as! OneCollectionViewCell
//            cell.backgroundColor = .white
            cell.positionOneLabel.text = titleLabels[indexPath.section]
//            cell.positionOneLabel.textColor = .black
            cell.counselorOne.text = masterList?[indexPath.row][indexPath.section].counselors[0]?.name ?? ""

            let counselorOne = masterList?[indexPath.row][indexPath.section].counselors[0]

            
            if let searchRoles = counselorOne?.roles {
                if searchRoles.contains(searchTerm ?? "") || counselorOne?.name == searchTerm ?? "" {
                    cell.counselorOne.textColor = .red
                } else {
                    cell.counselorOne.textColor = UIColor(named: "textColor")
                }
            }
            
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
        } else if indexPath.section == 16 {
            return CGSize(width: 180, height: 150)
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
//        searchBar.delegate = self
        searchBar.delegate = self
        searchBar.dataSource = self
        shiftViewModel = ShiftViewModel(viewController: self)
        shiftViewModel?.delegate = self
        counselorViewModel = CounselorViewModel()
        populateButton = UIBarButtonItem(title: "Populate", style: .plain, target: self, action: #selector(populateTable))
        printButton = UIBarButtonItem(title: "Print", style: .plain, target: self, action: #selector(printSchedule))
        printButton.isEnabled = false
        navigationItem.rightBarButtonItems = [printButton, populateButton]
        counselorTable.keyboardDismissMode = .onDrag
        updateData()
        // Do any additional setup after loading the view.
    }
    
    func generateTextDictionary(counselors: [String], roles: [String]) {
        var ret = [RVS_AutofillTextFieldDataSourceType]()
        var newList = counselors + roles
        for i in newList {
            ret.append(RVS_AutofillTextFieldDataSourceType(value: i))
        }
        textDictionary = ret
    }
    
//    func populateNamesForSearch() {
//        counselors.map { counselorNamesSearch.append($0.name) }
//    }
    
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
    
    
    
    @objc func auditionValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.tag {
        case 0:
            auditionList[sender.tag] = sender.selectedSegmentIndex
        case 1:
            auditionList[sender.tag] = sender.selectedSegmentIndex
        case 2:
            auditionList[sender.tag] = sender.selectedSegmentIndex
        case 3:
            auditionList[sender.tag] = sender.selectedSegmentIndex
        case 4:
            auditionList[sender.tag] = sender.selectedSegmentIndex
        case 5:
            auditionList[sender.tag] = sender.selectedSegmentIndex
        case 6:
            auditionList[sender.tag] = sender.selectedSegmentIndex
        default:
            break
        }
        
        print(auditionList)
    }
    
    func updateData() {
        counselorViewModel?.counselorList.bind(listener: { [self] counselor in
            self.counselors = counselor
            self.counselorNamesSearch = counselor.map { $0.name }
            generateTextDictionary(counselors: self.counselorNamesSearch, roles: self.roles)
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
        shiftViewModel?.masterCounselorList = self.counselors
        
        shiftViewModel?.sundaySupervisionList = self.sundaySupervisionList
        shiftViewModel?.sundayRecList = self.sundayRecList
        shiftViewModel?.sundayOffList = self.sundayOffList
        shiftViewModel?.sundayNightWatch = self.sundayNightWatch ?? [nil,nil]
        
        shiftViewModel?.mondaySupervisionList = self.mondaySupervisionList
        shiftViewModel?.mondayRecList = self.mondayRecList
        shiftViewModel?.mondayOffList = self.mondayOffList
        shiftViewModel?.mondayNightWatch = self.mondayNightWatch ?? [nil,nil]
        
        shiftViewModel?.tuesdaySupervisionList = self.tuesdaySupervisionList
        shiftViewModel?.tuesdayRecList = self.tuesdayRecList
        shiftViewModel?.tuesdayOffList = self.tuesdayOffList
        shiftViewModel?.tuesdayNightWatch = self.tuesdayNightWatch ?? [nil,nil]
        
        shiftViewModel?.wednesdaySupervisionList = self.wednesdaySupervisionList
        shiftViewModel?.wednesdayRecList = self.wednesdayRecList
        shiftViewModel?.wednesdayOffList = self.wednesdayOffList
        shiftViewModel?.wednesdayNightWatch = self.wednesdayNightWatch ?? [nil,nil]
        
        shiftViewModel?.thursdaySupervisionList = self.thursdaySupervisionList
        shiftViewModel?.thursdayRecList = self.thursdayRecList
        shiftViewModel?.thursdayOffList = self.thursdayOffList
        shiftViewModel?.thursdayNightWatch = self.thursdayNightWatch ?? [nil,nil]
        
        shiftViewModel?.fridaySupervisionList = self.fridaySupervisionList
        shiftViewModel?.fridayRecList = self.fridayRecList
        shiftViewModel?.fridayOffList = self.fridayOffList
        shiftViewModel?.fridayNightWatch = self.fridayNightWatch ?? [nil,nil]
        
        shiftViewModel?.saturdaySupervisionList = self.saturdaySupervisionList
        shiftViewModel?.saturdayRecList = self.saturdayRecList
        shiftViewModel?.saturdayOffList = self.saturdayOffList
        shiftViewModel?.saturdayNightWatch = self.saturdayNightWatch ?? [nil,nil]
    }
    
    @objc
    func populateTable() {
        shiftViewModel?.concertList.value = self.concertList
        print(shiftViewModel?.concertList.value, concertList)
        shiftViewModel?.auditionList.value = self.auditionList
        passData()
        shiftViewModel?.compileSingleLists()
        shiftViewModel?.populateSchedule()
        printButton.isEnabled = true
        shiftViewModel?.masterList.bind(listener: { shift in
            self.masterList = shift
        })
        counselorTable.reloadData()
    }
    
    @objc
    func printSchedule() {
        performSegue(withIdentifier: "toPrintSupervision", sender: nil)
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
        } else if indexPath.section == 16 {
            
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
    
    
    
    func autoFillTextField(_ autofillTextField: RVS_AutofillTextField, selectionWasMade: RVS_AutofillTextFieldDataSourceType) {
        searchTerm = ""
        searchTerm = selectionWasMade.value
        print("HERE'S THE SEARCH TERM \(searchTerm)")
        counselorTable.reloadData()
//        if selectedIndexPath!.section == 5 {
//
//        } else {
//            masterCounselorList = masterCounselorList?.filter { $0.name != selectionWasMade.value}
//        }
//        autofillTextField.text = selectionWasMade.value
//        generateTextDictionary(counselors: masterCounselorList ?? [])
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = searchBar.text! + string
        
        if searchText == "" {
            searchTerm = ""
            counselorTable.reloadData()
        }
        print("HERE IS THE SEARCH BAR TEXT",searchBar.text)
        if searchBar.text!.count <= 1 {
            searchTerm = ""
            counselorTable.reloadData()
        }
        return true
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
        } else if segue.identifier == "toPrintSupervision" {
            let destVC = segue.destination as! SupervisionPrintViewController
            destVC.loadViewIfNeeded()
            // sunday
            
            destVC.sundayMorningBasketballContent.text = masterList?[0][1].counselors[0]?.name ?? ""
            destVC.sundayMorningNorthPracticeVillageContent.text = masterList?[0][1].counselors[1]?.name ?? ""
            destVC.sundayMorningSouthPracticeVillageContent.text = masterList?[0][1].counselors[2]?.name ?? ""
            destVC.sundayMorningTentThreeContent.text = masterList?[0][1].counselors[3]?.name ?? ""
            destVC.sundayAfternoonBasketballContent.text = masterList?[0][2].counselors[0]?.name ?? ""
            destVC.sundayAfternoonNorthPracticeVillageContent.text = masterList?[0][2].counselors[1]?.name ?? ""
            destVC.sundayAfternoonSouthPracticeVillageContent.text = masterList?[0][2].counselors[2]?.name ?? ""
            destVC.sundayAfternoonTentThreeContent.text = masterList?[0][2].counselors[3]?.name ?? ""
            destVC.sundayEveningNorthContent.text = masterList?[0][3].counselors[0]?.name ?? ""
            destVC.sundayEveningSouthContent.text = masterList?[0][3].counselors[1]?.name ?? ""
//            destVC.sundayEveningActivityContent
            destVC.sundayNightwatchOneContent.text = masterList?[0][5].counselors[0]?.name ?? ""
            destVC.sundayNightwatchTwoContent.text = masterList?[0][5].counselors[1]?.name ?? ""
            destVC.sundayDayOffContentOne.text = masterList?[0][6].counselors[0]?.name ?? ""
            destVC.sundayDayOffContentTwo.text = masterList?[0][6].counselors[1]?.name ?? ""
            
            // monday
            
            destVC.mondayMorningBasketballContent.text = masterList?[1][1].counselors[0]?.name ?? ""
            destVC.mondayMorningNorthPracticeVillageContent.text = masterList?[1][1].counselors[1]?.name ?? ""
            destVC.mondayMorningSouthPracticeVillageContent.text = masterList?[1][1].counselors[2]?.name ?? ""
            destVC.mondayMorningTentThreeContent.text = masterList?[1][1].counselors[3]?.name ?? ""
            destVC.mondayAfternoonBasketballContent.text = masterList?[1][2].counselors[0]?.name ?? ""
            destVC.mondayAfternoonNorthPracticeVillageContent.text = masterList?[1][2].counselors[1]?.name ?? ""
            destVC.mondayAfternoonSouthPracticeVillageContent.text = masterList?[1][2].counselors[2]?.name ?? ""
            destVC.mondayAfternoonTentThreeContent.text = masterList?[1][2].counselors[3]?.name ?? ""
            destVC.mondayEveningNorthContent.text = masterList?[1][3].counselors[0]?.name ?? ""
            destVC.mondayEveningSouthContent.text = masterList?[1][3].counselors[1]?.name ?? ""
            //            destVC.mondayEveningActivityContent
            destVC.mondayNightwatchOneContent.text = masterList?[1][5].counselors[0]?.name ?? ""
            destVC.mondayNightwatchTwoContent.text = masterList?[1][5].counselors[1]?.name ?? ""
            destVC.mondayDayOffContentOne.text = masterList?[1][6].counselors[0]?.name ?? ""
            destVC.mondayDayOffContentTwo.text = masterList?[1][6].counselors[1]?.name ?? ""
            
            // tuesday
            
            destVC.tuesdayMorningBasketballContent.text = masterList?[2][1].counselors[0]?.name ?? ""
            destVC.tuesdayMorningNorthPracticeVillageContent.text = masterList?[2][1].counselors[1]?.name ?? ""
            destVC.tuesdayMorningSouthPracticeVillageContent.text = masterList?[2][1].counselors[2]?.name ?? ""
            destVC.tuesdayMorningTentThreeContent.text = masterList?[2][1].counselors[3]?.name ?? ""
            destVC.tuesdayAfternoonBasketballContent.text = masterList?[2][2].counselors[0]?.name ?? ""
            destVC.tuesdayAfternoonNorthPracticeVillageContent.text = masterList?[2][2].counselors[1]?.name ?? ""
            destVC.tuesdayAfternoonSouthPracticeVillageContent.text = masterList?[2][2].counselors[2]?.name ?? ""
            destVC.tuesdayAfternoonTentThreeContent.text = masterList?[2][2].counselors[3]?.name ?? ""
            destVC.tuesdayEveningNorthContent.text = masterList?[2][3].counselors[0]?.name ?? ""
            destVC.tuesdayEveningSouthContent.text = masterList?[2][3].counselors[1]?.name ?? ""
            //            destVC.tuesdayEveningActivityContent
            destVC.tuesdayNightwatchOneContent.text = masterList?[2][5].counselors[0]?.name ?? ""
            destVC.tuesdayNightwatchTwoContent.text = masterList?[2][5].counselors[1]?.name ?? ""
            destVC.tuesdayDayOffContentOne.text = masterList?[2][6].counselors[0]?.name ?? ""
            destVC.tuesdayDayOffContentTwo.text = masterList?[2][6].counselors[1]?.name ?? ""
            
            // wednesday
            
            destVC.wednesdayMorningBasketballContent.text = masterList?[3][1].counselors[0]?.name ?? ""
            destVC.wednesdayMorningNorthPracticeVillageContent.text = masterList?[3][1].counselors[1]?.name ?? ""
            destVC.wednesdayMorningSouthPracticeVillageContent.text = masterList?[3][1].counselors[2]?.name ?? ""
            destVC.wednesdayMorningTentThreeContent.text = masterList?[3][1].counselors[3]?.name ?? ""
            destVC.wednesdayAfternoonBasketballContent.text = masterList?[3][2].counselors[0]?.name ?? ""
            destVC.wednesdayAfternoonNorthPracticeVillageContent.text = masterList?[3][2].counselors[1]?.name ?? ""
            destVC.wednesdayAfternoonSouthPracticeVillageContent.text = masterList?[3][2].counselors[2]?.name ?? ""
            destVC.wednesdayAfternoonTentThreeContent.text = masterList?[3][2].counselors[3]?.name ?? ""
            destVC.wednesdayEveningNorthContent.text = masterList?[3][3].counselors[0]?.name ?? ""
            destVC.wednesdayEveningSouthContent.text = masterList?[3][3].counselors[1]?.name ?? ""
            //            destVC.wednesdayEveningActivityContent
            destVC.wednesdayNightwatchOneContent.text = masterList?[3][5].counselors[0]?.name ?? ""
            destVC.wednesdayNightwatchTwoContent.text = masterList?[3][5].counselors[1]?.name ?? ""
            destVC.wednesdayDayOffContentOne.text = masterList?[3][6].counselors[0]?.name ?? ""
            destVC.wednesdayDayOffContentTwo.text = masterList?[3][6].counselors[1]?.name ?? ""
            
            // thursday
            
            destVC.thursdayMorningBasketballContent.text = masterList?[4][1].counselors[0]?.name ?? ""
            destVC.thursdayMorningNorthPracticeVillageContent.text = masterList?[4][1].counselors[1]?.name ?? ""
            destVC.thursdayMorningSouthPracticeVillageContent.text = masterList?[4][1].counselors[2]?.name ?? ""
            destVC.thursdayMorningTentThreeContent.text = masterList?[4][1].counselors[3]?.name ?? ""
            destVC.thursdayAfternoonBasketballContent.text = masterList?[4][2].counselors[0]?.name ?? ""
            destVC.thursdayAfternoonNorthPracticeVillageContent.text = masterList?[4][2].counselors[1]?.name ?? ""
            destVC.thursdayAfternoonSouthPracticeVillageContent.text = masterList?[4][2].counselors[2]?.name ?? ""
            destVC.thursdayAfternoonTentThreeContent.text = masterList?[4][2].counselors[3]?.name ?? ""
            destVC.thursdayEveningNorthContent.text = masterList?[4][3].counselors[0]?.name ?? ""
            destVC.thursdayEveningSouthContent.text = masterList?[4][3].counselors[1]?.name ?? ""
            //            destVC.thursdayEveningActivityContent
            destVC.thursdayNightwatchOneContent.text = masterList?[4][5].counselors[0]?.name ?? ""
            destVC.thursdayNightwatchTwoContent.text = masterList?[4][5].counselors[1]?.name ?? ""
            destVC.thursdayDayOffContentOne.text = masterList?[4][6].counselors[0]?.name ?? ""
            destVC.thursdayDayOffContentTwo.text = masterList?[4][6].counselors[1]?.name ?? ""
            
            // friday
            
            destVC.fridayMorningBasketballContent.text = masterList?[5][1].counselors[0]?.name ?? ""
            destVC.fridayMorningNorthPracticeVillageContent.text = masterList?[5][1].counselors[1]?.name ?? ""
            destVC.fridayMorningSouthPracticeVillageContent.text = masterList?[5][1].counselors[2]?.name ?? ""
            destVC.fridayMorningTentThreeContent.text = masterList?[5][1].counselors[3]?.name ?? ""
            destVC.fridayAfternoonBasketballContent.text = masterList?[5][2].counselors[0]?.name ?? ""
            destVC.fridayAfternoonNorthPracticeVillageContent.text = masterList?[5][2].counselors[1]?.name ?? ""
            destVC.fridayAfternoonSouthPracticeVillageContent.text = masterList?[5][2].counselors[2]?.name ?? ""
            destVC.fridayAfternoonTentThreeContent.text = masterList?[5][2].counselors[3]?.name ?? ""
            destVC.fridayEveningNorthContent.text = masterList?[5][3].counselors[0]?.name ?? ""
            destVC.fridayEveningSouthContent.text = masterList?[5][3].counselors[1]?.name ?? ""
            //            destVC.fridayEveningActivityContent
            destVC.fridayNightwatchOneContent.text = masterList?[5][5].counselors[0]?.name ?? ""
            destVC.fridayNightwatchTwoContent.text = masterList?[5][5].counselors[1]?.name ?? ""
            destVC.fridayDayOffContentOne.text = masterList?[5][6].counselors[0]?.name ?? ""
            destVC.fridayDayOffContentTwo.text = masterList?[5][6].counselors[1]?.name ?? ""
            
            // saturday
            
            destVC.saturdayMorningBasketballContent.text = masterList?[6][1].counselors[0]?.name ?? ""
            destVC.saturdayMorningNorthPracticeVillageContent.text = masterList?[6][1].counselors[1]?.name ?? ""
            destVC.saturdayMorningSouthPracticeVillageContent.text = masterList?[6][1].counselors[2]?.name ?? ""
            destVC.saturdayMorningTentThreeContent.text = masterList?[6][1].counselors[3]?.name ?? ""
            destVC.saturdayAfternoonBasketballContent.text = masterList?[6][2].counselors[0]?.name ?? ""
            destVC.saturdayAfternoonNorthPracticeVillageContent.text = masterList?[6][2].counselors[1]?.name ?? ""
            destVC.saturdayAfternoonSouthPracticeVillageContent.text = masterList?[6][2].counselors[2]?.name ?? ""
            destVC.saturdayAfternoonTentThreeContent.text = masterList?[6][2].counselors[3]?.name ?? ""
            destVC.saturdayEveningNorthContent.text = masterList?[6][3].counselors[0]?.name ?? ""
            destVC.saturdayEveningSouthContent.text = masterList?[6][3].counselors[1]?.name ?? ""
            //            destVC.saturdayEveningActivityContent
            destVC.saturdayNightwatchOneContent.text = masterList?[6][5].counselors[0]?.name ?? ""
            destVC.saturdayNightwatchTwoContent.text = masterList?[6][5].counselors[1]?.name ?? ""
            destVC.saturdayDayOffContentOne.text = masterList?[6][6].counselors[0]?.name ?? ""
            destVC.saturdayDayOffContentTwo.text = masterList?[6][6].counselors[1]?.name ?? ""
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


extension CounselorScheduleViewController: ShiftDelegate {
    func reloadTable() {
        counselorTable.reloadData()
    }
    
    func presentAlert(counselor: Counselor) {
        let ac = UIAlertController(title: "Unable to Place", message: "The algorithm was unable to assign a nightwatch position for \(counselor.name). What would you like to do?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Rerun Algorithm", style: .destructive, handler: { (action) -> Void in
//            self.shiftViewModel?.clearNightwatch()
//            self.shiftViewModel?.assignNightwatch()
            self.populateTable()
//            self.counselorConflict()
        }))
        ac.addAction(UIAlertAction(title: "Assign Manually", style: .default, handler: { (action) -> Void in
            self.shiftViewModel?.assignRecShifts()
        }))
        present(ac, animated: true)
    }
    
    func updateRecLists(sunday: [Counselor], monday: [Counselor], tuesday: [Counselor], wednesday: [Counselor], thursday: [Counselor], friday: [Counselor], saturday: [Counselor]) {
        self.sundayRecList = sunday
        self.mondayRecList = monday
        self.tuesdayRecList = tuesday
        self.wednesdayRecList = wednesday
        self.thursdayRecList = thursday
        self.fridayRecList = friday
        self.saturdayRecList = saturday
    }
    
    func updateSupervisionShifts(sunday: [Counselor], monday: [Counselor], tuesday: [Counselor], wednesday: [Counselor], thursday: [Counselor], friday: [Counselor], saturday: [Counselor]) {
        self.sundaySupervisionList = sunday
        self.mondaySupervisionList = monday
        self.tuesdaySupervisionList = tuesday
        self.wednesdaySupervisionList = wednesday
        self.thursdaySupervisionList = thursday
        self.fridaySupervisionList = friday
        self.saturdaySupervisionList = saturday
    }
    
}

//extension CounselorScheduleViewController: UITextFieldDelegate {
////    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////
////        if counselorNamesSearch.contains(searchText) {
////            searchTerm = searchText
////            counselorTable.reloadData()
////        } else if roles.contains(searchText) {
////            searchTerm = searchText
////            counselorTable.reloadData()
////        }
////
////    }
//}
