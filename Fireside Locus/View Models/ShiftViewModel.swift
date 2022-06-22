//
//  ShiftViewModel.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/29/22.
//

import Foundation
import UIKit

protocol ShiftDelegate {
    func reloadTable()
    func presentAlert(counselor: Counselor)
    func updateRecLists(sunday: [Counselor], monday: [Counselor], tuesday: [Counselor], wednesday: [Counselor], thursday: [Counselor], friday: [Counselor], saturday: [Counselor])
    func updateSupervisionShifts(sunday: [Counselor], monday: [Counselor], tuesday: [Counselor], wednesday: [Counselor], thursday: [Counselor], friday: [Counselor], saturday: [Counselor])
}

class ShiftViewModel {
    
    var prevWeekNightWatch: [Counselor?] = [nil, nil] {
        didSet {
            print("HERE IS PREVIOUS WEEK NIGHTWATCH",prevWeekNightWatch)
        }
    }
    
    var sundaySupervisionList: [Counselor]?
    var sundayRecList: [Counselor]?
    var sundayOffList: [Counselor]?
    var sundayNightWatch: [Counselor?] = [nil,nil]
    
    var mondaySupervisionList: [Counselor]?
    var mondayRecList: [Counselor]?
    var mondayOffList: [Counselor]?
    var mondayNightWatch: [Counselor?] = [nil,nil]
    
    var tuesdaySupervisionList: [Counselor]?
    var tuesdayRecList: [Counselor]?
    var tuesdayOffList: [Counselor]?
    var tuesdayNightWatch: [Counselor?] = [nil,nil]
    
    var wednesdaySupervisionList: [Counselor]?
    var wednesdayRecList: [Counselor]?
    var wednesdayOffList: [Counselor]?
    var wednesdayNightWatch: [Counselor?] = [nil,nil]
    
    var thursdaySupervisionList: [Counselor]?
    var thursdayRecList: [Counselor]?
    var thursdayOffList: [Counselor]?
    var thursdayNightWatch: [Counselor?] = [nil,nil]
    
    var fridaySupervisionList: [Counselor]?
    var fridayRecList: [Counselor]?
    var fridayOffList: [Counselor]?
    var fridayNightWatch: [Counselor?] = [nil,nil]
    
    var saturdaySupervisionList: [Counselor]?
    var saturdayRecList: [Counselor]?
    var saturdayOffList: [Counselor]?
    var saturdayNightWatch: [Counselor?] = [nil,nil]
    
    var masterNightwatch: [[Counselor]?]?
    var masterDaysOff: [[Counselor]?]?
    var masterCounselorList: [Counselor]?
    
    var concertList: Binder<[Int]> = Binder([0,0,0,0,0,0,0])
    var auditionList: Binder<[Int]> = Binder([0,0,0,0,0,0,0])
    
    var viewController: UIViewController?
    var delegate: ShiftDelegate?
    
    var masterList: Binder<[[Shift]]> = Binder(
        [
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])]
        ]
    )
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func compileSingleLists() {
        //        masterNightwatch = [sundayNightWatch, mondayNightWatch, tuesdayNightWatch, wednesdayNightWatch, thursdayNightWatch, fridayNightWatch, saturdayNightWatch]
        masterDaysOff = [sundayOffList, mondayOffList, tuesdayOffList, wednesdayOffList, thursdayOffList, fridayOffList, saturdayOffList]
    }
#warning("This will WIPE any pre-assigned nightwatch shifts. Try to figure out a way to carry over manual selections")
    func assignNightwatch() {
        let start = CFAbsoluteTimeGetCurrent()
        clearNightwatch()
        var counselorOptions = masterCounselorList!
        var assignedCounselors = [Counselor]()
        var listOfDays = [0,1,2,3,4,5,6]
        var possibleDays: [Int]
        counselorOptions = counselorOptions.shuffled()
        for counselor in counselorOptions {
            possibleDays = listOfDays
            for day in listOfDays {
                let currentDayOffList = masterDaysOff?[day] ?? []
                for off in currentDayOffList {
                    if off == counselor {
                        if day == 0 {
                            possibleDays = possibleDays.filter({ $0 != day})
                        } else {
                            possibleDays = possibleDays.filter({ $0 != day})
                            possibleDays = possibleDays.filter({ $0 != day - 1})
                        }
                    }
                }
            }
            
            /*
             
             For assignment:
             
             assign counselor to local variable, if they are able to be placed, change local variable to nil
             loop through all available days for preference and break if placed
             
             if they can't be placed in their preference, move to opposite placement 0 -> 1 or 1 -> 0 and loop through all available days again
             
             for no preference use random(in: 0...1) for index position
             
             for day in availableDays {
             if localCounselor == nil {
             break
             }
             }
             
             */
            possibleDays = possibleDays.shuffled()
            var localCounselor: Counselor? = counselor
            if counselor.nightwatchPreferences.contains("Early Riser") {
                //                print("HERE'S AN EARLY RISER \(counselor.name)")
                for day in possibleDays {
                    if localCounselor == nil {
                        break
                    }
                    switch day {
                    case 0:
                        if sundayNightWatch[1] == nil {
                            sundayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: sundayNightWatch)
                        } else {
                            break
                        }
                    case 1:
                        if mondayNightWatch[1] == nil {
                            mondayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: mondayNightWatch)
                        } else {
                            break
                        }
                    case 2:
                        if tuesdayNightWatch[1] == nil {
                            tuesdayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: tuesdayNightWatch)
                        } else {
                            break
                        }
                    case 3:
                        if wednesdayNightWatch[1] == nil {
                            wednesdayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: wednesdayNightWatch)
                        } else {
                            break
                        }
                    case 4:
                        if thursdayNightWatch[1] == nil {
                            thursdayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: thursdayNightWatch)
                        } else {
                            break
                        }
                    case 5:
                        if fridayNightWatch[1] == nil {
                            fridayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: fridayNightWatch)
                        } else {
                            break
                        }
                    case 6:
                        if saturdayNightWatch[1] == nil {
                            saturdayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: saturdayNightWatch)
                        } else {
                            break
                        }
                    default:
                        print(day)
                    }
                }
                for day in possibleDays {
                    if localCounselor == nil {
                        break
                    }
                    switch day {
                    case 0:
                        if sundayNightWatch[0] == nil {
                            sundayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: sundayNightWatch)
                        } else {
                            break
                        }
                    case 1:
                        if mondayNightWatch[0] == nil {
                            mondayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: mondayNightWatch)
                        } else {
                            break
                        }
                    case 2:
                        if tuesdayNightWatch[0] == nil {
                            tuesdayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: tuesdayNightWatch)
                        } else {
                            break
                        }
                    case 3:
                        if wednesdayNightWatch[0] == nil {
                            wednesdayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: wednesdayNightWatch)
                        } else {
                            break
                        }
                    case 4:
                        if thursdayNightWatch[0] == nil {
                            thursdayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: thursdayNightWatch)
                        } else {
                            break
                        }
                    case 5:
                        if fridayNightWatch[0] == nil {
                            fridayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: fridayNightWatch)
                        } else {
                            break
                        }
                    case 6:
                        if saturdayNightWatch[0] == nil {
                            saturdayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: saturdayNightWatch)
                        } else {
                            break
                        }
                    default:
                        print(day)
                    }
                }
            } else if counselor.nightwatchPreferences.contains("Night Owl") {
                //                print("HERE IS A NIGHT OWL \(counselor.name)")
                for day in possibleDays {
                    if localCounselor == nil {
                        break
                    }
                    switch day {
                    case 0:
                        if sundayNightWatch[0] == nil {
                            sundayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: sundayNightWatch)
                        } else {
                            break
                        }
                    case 1:
                        if mondayNightWatch[0] == nil {
                            mondayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: mondayNightWatch)
                        } else {
                            break
                        }
                    case 2:
                        if tuesdayNightWatch[0] == nil {
                            tuesdayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: tuesdayNightWatch)
                        } else {
                            break
                        }
                    case 3:
                        if wednesdayNightWatch[0] == nil {
                            wednesdayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: wednesdayNightWatch)
                        } else {
                            break
                        }
                    case 4:
                        if thursdayNightWatch[0] == nil {
                            thursdayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: thursdayNightWatch)
                        } else {
                            break
                        }
                    case 5:
                        if fridayNightWatch[0] == nil {
                            fridayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: fridayNightWatch)
                        } else {
                            break
                        }
                    case 6:
                        if saturdayNightWatch[0] == nil {
                            saturdayNightWatch[0] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: saturdayNightWatch)
                        } else {
                            break
                        }
                    default:
                        print(day)
                    }
                }
                for day in possibleDays {
                    if localCounselor == nil {
                        break
                    }
                    switch day {
                    case 0:
                        if sundayNightWatch[1] == nil {
                            sundayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: sundayNightWatch)
                        } else {
                            break
                        }
                    case 1:
                        if mondayNightWatch[1] == nil {
                            mondayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: mondayNightWatch)
                        } else {
                            break
                        }
                    case 2:
                        if tuesdayNightWatch[1] == nil {
                            tuesdayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: tuesdayNightWatch)
                        } else {
                            break
                        }
                    case 3:
                        if wednesdayNightWatch[1] == nil {
                            wednesdayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: wednesdayNightWatch)
                        } else {
                            break
                        }
                    case 4:
                        if thursdayNightWatch[1] == nil {
                            thursdayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: thursdayNightWatch)
                        } else {
                            break
                        }
                    case 5:
                        if fridayNightWatch[1] == nil {
                            fridayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: fridayNightWatch)
                        } else {
                            break
                        }
                    case 6:
                        if saturdayNightWatch[1] == nil {
                            saturdayNightWatch[1] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: saturdayNightWatch)
                        } else {
                            break
                        }
                    default:
                        print(day)
                    }
                }
            } else {
                for day in possibleDays {
                    if localCounselor == nil {
                        break
                    }
                    let randomNum = Int.random(in: 0...1)
                    switch day {
                    case 0:
                        if sundayNightWatch[randomNum] == nil {
                            sundayNightWatch[randomNum] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: sundayNightWatch)
                        } else {
                            break
                        }
                    case 1:
                        if mondayNightWatch[randomNum] == nil {
                            mondayNightWatch[randomNum] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: mondayNightWatch)
                        } else {
                            break
                        }
                    case 2:
                        if tuesdayNightWatch[randomNum] == nil {
                            tuesdayNightWatch[randomNum] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: tuesdayNightWatch)
                        } else {
                            break
                        }
                    case 3:
                        if wednesdayNightWatch[randomNum] == nil {
                            wednesdayNightWatch[randomNum] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: wednesdayNightWatch)
                        } else {
                            break
                        }
                    case 4:
                        if thursdayNightWatch[randomNum] == nil {
                            thursdayNightWatch[randomNum] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: thursdayNightWatch)
                        } else {
                            break
                        }
                    case 5:
                        if fridayNightWatch[randomNum] == nil {
                            fridayNightWatch[randomNum] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: fridayNightWatch)
                        } else {
                            break
                        }
                    case 6:
                        if saturdayNightWatch[randomNum] == nil {
                            saturdayNightWatch[randomNum] = counselor
                            localCounselor = nil
                            masterList.value[day][5] = Shift(counselors: saturdayNightWatch)
                        } else {
                            break
                        }
                    default:
                        print(day)
                    }
                }
            }
            if localCounselor != nil {
                //                let ac = UIAlertController(title: "Unable to Place", message: "The algorithm was unable to assign a nightwatch position for \(counselor.name). What would you like to do?", preferredStyle: .alert)
                //                ac.addAction(UIAlertAction(title: "Rerun Algorithm", style: .destructive, handler: { (action) -> Void in
                //                    self.counselorConflict()
                //                    return
                //                }))
                //                ac.addAction(UIAlertAction(title: "Assign Manually", style: .default))
                //                viewController?.present(ac, animated: true)
                delegate?.presentAlert(counselor: counselor)
                
                break
            }
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        print("Nightwatch scheduling took \(diff) seconds")
        assignRecShifts()
        assignSupervisionShifts()
    }
    
    func clearRec() {
        sundayRecList = masterCounselorList
        mondayRecList = masterCounselorList
        tuesdayRecList = masterCounselorList
        wednesdayRecList = masterCounselorList
        thursdayRecList = masterCounselorList
        fridayRecList = masterCounselorList
        saturdayRecList = masterCounselorList
        for i in 0...6 {
            switch i {
            case 0:
                masterList.value[i][8] = Shift(counselors: [nil])
                masterList.value[i][9] = Shift(counselors: [nil])
                masterList.value[i][10] = Shift(counselors: [nil])
                masterList.value[i][11] = Shift(counselors: [nil, nil])
                masterList.value[i][12] = Shift(counselors: [nil])
                masterList.value[i][13] = Shift(counselors: [nil])
                masterList.value[i][14] = Shift(counselors: [nil])
                masterList.value[i][15] = Shift(counselors: [nil])
            case 1:
                masterList.value[i][8] = Shift(counselors: [nil])
                masterList.value[i][9] = Shift(counselors: [nil])
                masterList.value[i][10] = Shift(counselors: [nil])
                masterList.value[i][11] = Shift(counselors: [nil, nil])
                masterList.value[i][12] = Shift(counselors: [nil])
                masterList.value[i][13] = Shift(counselors: [nil])
                masterList.value[i][14] = Shift(counselors: [nil])
                masterList.value[i][15] = Shift(counselors: [nil])
            case 2:
                masterList.value[i][8] = Shift(counselors: [nil])
                masterList.value[i][9] = Shift(counselors: [nil])
                masterList.value[i][10] = Shift(counselors: [nil])
                masterList.value[i][11] = Shift(counselors: [nil, nil])
                masterList.value[i][12] = Shift(counselors: [nil])
                masterList.value[i][13] = Shift(counselors: [nil])
                masterList.value[i][14] = Shift(counselors: [nil])
                masterList.value[i][15] = Shift(counselors: [nil])
            case 3:
                masterList.value[i][8] = Shift(counselors: [nil])
                masterList.value[i][9] = Shift(counselors: [nil])
                masterList.value[i][10] = Shift(counselors: [nil])
                masterList.value[i][11] = Shift(counselors: [nil, nil])
                masterList.value[i][12] = Shift(counselors: [nil])
                masterList.value[i][13] = Shift(counselors: [nil])
                masterList.value[i][14] = Shift(counselors: [nil])
                masterList.value[i][15] = Shift(counselors: [nil])
            case 4:
                masterList.value[i][8] = Shift(counselors: [nil])
                masterList.value[i][9] = Shift(counselors: [nil])
                masterList.value[i][10] = Shift(counselors: [nil])
                masterList.value[i][11] = Shift(counselors: [nil, nil])
                masterList.value[i][12] = Shift(counselors: [nil])
                masterList.value[i][13] = Shift(counselors: [nil])
                masterList.value[i][14] = Shift(counselors: [nil])
                masterList.value[i][15] = Shift(counselors: [nil])
            case 5:
                masterList.value[i][8] = Shift(counselors: [nil])
                masterList.value[i][9] = Shift(counselors: [nil])
                masterList.value[i][10] = Shift(counselors: [nil])
                masterList.value[i][11] = Shift(counselors: [nil, nil])
                masterList.value[i][12] = Shift(counselors: [nil])
                masterList.value[i][13] = Shift(counselors: [nil])
                masterList.value[i][14] = Shift(counselors: [nil])
                masterList.value[i][15] = Shift(counselors: [nil])
            case 6:
                masterList.value[i][8] = Shift(counselors: [nil])
                masterList.value[i][9] = Shift(counselors: [nil])
                masterList.value[i][10] = Shift(counselors: [nil])
                masterList.value[i][11] = Shift(counselors: [nil, nil])
                masterList.value[i][12] = Shift(counselors: [nil])
                masterList.value[i][13] = Shift(counselors: [nil])
                masterList.value[i][14] = Shift(counselors: [nil])
                masterList.value[i][15] = Shift(counselors: [nil])
            default:
                print("Could not reset")
            }
        }
        print("HERE IS THE MASTER LIST \(masterCounselorList)")
    }
    
    func clearSupervision() {
        sundaySupervisionList = masterCounselorList
        mondaySupervisionList = masterCounselorList
        tuesdaySupervisionList = masterCounselorList
        wednesdaySupervisionList = masterCounselorList
        thursdaySupervisionList = masterCounselorList
        fridaySupervisionList = masterCounselorList
        saturdaySupervisionList = masterCounselorList
        for i in 0...6 {
            switch i {
            case 0:
                masterList.value[i][1] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][2] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][3] = Shift(counselors: [nil, nil])
            case 1:
                masterList.value[i][1] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][2] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][3] = Shift(counselors: [nil, nil])
            case 2:
                masterList.value[i][1] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][2] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][3] = Shift(counselors: [nil, nil])
            case 3:
                masterList.value[i][1] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][2] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][3] = Shift(counselors: [nil, nil])
            case 4:
                masterList.value[i][1] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][2] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][3] = Shift(counselors: [nil, nil])
            case 5:
                masterList.value[i][1] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][2] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][3] = Shift(counselors: [nil, nil])
            case 6:
                masterList.value[i][1] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][2] = Shift(counselors: [nil, nil, nil, nil])
                masterList.value[i][3] = Shift(counselors: [nil, nil])
            default:
                print("Could not reset")
            }
        }
    }
    
    func assignSupervisionShifts() {
        clearSupervision()
        print("from assignment \(concertList.value)")
        for day in 0...6 {
            switch day {
            case 0:
                var sundayList = sundaySupervisionList ?? []
                var sundayOff = sundayOffList ?? []
                var localList = [Counselor]()
                localList = sundayList.filter { counselor in
                    return !sundayOff.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
//                localList = localList.shuffled()
                var stageManager = [Counselor]()
                var frontOfHouse = [Counselor]()
                var boxOffice = [Counselor]()
                var orchestraAssistant = [Counselor]()
                var socialMedia = [Counselor]()
                var pianoAssistant = [Counselor]()
                var rest = [Counselor]()
                for i in localList {
                    if i.roles.contains("Stage Manager") {
                        stageManager.append(i)
                    } else if i.roles.contains("Front of House") {
                        frontOfHouse.append(i)
                    } else if i.roles.contains("Box Office") {
                        boxOffice.append(i)
                    } else if i.roles.contains("Orchestra Assistant") {
                        orchestraAssistant.append(i)
                    } else if i.roles.contains("Social Media Assistant") {
                        socialMedia.append(i)
                    } else if i.roles.contains("Piano TA"){
                        pianoAssistant.append(i)
                    } else {
                        rest.append(i)
                    }
                }
                stageManager = stageManager.shuffled()
                socialMedia = socialMedia.shuffled()
                frontOfHouse = frontOfHouse.shuffled()
                orchestraAssistant = orchestraAssistant.shuffled()
                boxOffice = boxOffice.shuffled()
                rest = rest.shuffled()
                localList = stageManager + socialMedia + frontOfHouse + orchestraAssistant + boxOffice + pianoAssistant + rest
                var localMorning: [Counselor?] = [nil, nil, nil, nil]
                var localAfternoon: [Counselor?] = [nil, nil, nil, nil]
                var localEvening: [Counselor?] = [nil, nil]
                var sundayAssigned = [Counselor]()
                
                var unspecificIndices = [Int]()
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                
                for counselor in localList {
                    
                    var availableIndices = [0, 1 ,2]
                    if prevWeekNightWatch.contains(counselor) {
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                    }
                    switch counselor.recreationPreferences {
                    case let role where counselor.roles.contains("Stage Manager"):
                        
                        
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        
                        if auditionList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                                availableIndices.remove(at: idx)
                            }
                            // morning auditions
                        } else if auditionList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                            // afternoon auditions
                        } else if auditionList.value[day] == 3 {
                            //evening auditions
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else {
                            // no auditions
                        }
                        
//                        availableIndices = availableIndices.shuffled()
//                        //                        for i in availableIndices {
//                        //
//                        //                        }
//                        if localEvening[0] == nil {
//                            localEvening.insert(counselor, at: 0)
//                            masterList.value[day][3].counselors.insert(counselor, at: 0)
//                            sundayAssigned.append(counselor)
//                            break
//                        } else if localEvening[1] == nil {
//                            localEvening.insert(counselor, at: 1)
//                            masterList.value[day][3].counselors.insert(counselor, at: 1)
//                            sundayAssigned.append(counselor)
//                            break
//                        } else {
//                            var randomShift = [0, 1, 2, 3]
//                            randomShift = randomShift.shuffled()
//                            for i in randomShift {
//                                if localMorning[i] == nil {
//                                    localMorning.insert(counselor, at: i)
//                                    masterList.value[day][1].counselors.insert(counselor, at: i)
//                                    sundayAssigned.append(counselor)
//                                    break
//                                }
//                            }
//                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Front of House"):
                        
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Orchestra Assistant"):
                        
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Social Media Assistant"):
                        
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                        
//                    case let role where counselor.roles.contains("Box Office"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        sundayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        sundayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        sundayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                    case let role where counselor.roles.contains("Piano TA"):
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    default:
                        
//                        var availableShifts = [0, 1, 2]
                        var availableShifts = availableIndices.shuffled()
                        for i in availableShifts {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    }
                    print("Here's morning: \(localMorning.map { $0?.name ?? "empty" }) current counselor \(counselor)")
                    print("Here's afterNoon: \(localAfternoon.map { $0?.name ?? "empty" }) current counselor \(counselor)")
                    print("Here's Evening: \(localEvening.map { $0?.name ?? "empty" }) current counselor \(counselor)")
                }
                print("Here is sunday assigned count \(sundayAssigned.count)")
                print("Here are the counselors that have been assigned \(sundayAssigned.map { $0.name })")
                sundaySupervisionList = sundaySupervisionList?.filter { counselor in
                    return !sundayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 1:
                var mondayList = mondaySupervisionList ?? []
                var mondayOff = mondayOffList ?? []
                var localList = [Counselor]()
                localList = mondayList.filter { counselor in
                    return !mondayOff.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
//                localList = localList.shuffled()
                var stageManager = [Counselor]()
                var frontOfHouse = [Counselor]()
                var boxOffice = [Counselor]()
                var orchestraAssistant = [Counselor]()
                var socialMedia = [Counselor]()
                var pianoAssistant = [Counselor]()
                var rest = [Counselor]()
                for i in localList {
                    if i.roles.contains("Stage Manager") {
                        stageManager.append(i)
                    } else if i.roles.contains("Front of House") {
                        frontOfHouse.append(i)
                    } else if i.roles.contains("Box Office") {
                        boxOffice.append(i)
                    } else if i.roles.contains("Orchestra Assistant") {
                        orchestraAssistant.append(i)
                    } else if i.roles.contains("Social Media Assistant") {
                        socialMedia.append(i)
                    } else if i.roles.contains("Piano TA"){
                        pianoAssistant.append(i)
                    } else {
                        rest.append(i)
                    }
                }
                stageManager = stageManager.shuffled()
                socialMedia = socialMedia.shuffled()
                frontOfHouse = frontOfHouse.shuffled()
                orchestraAssistant = orchestraAssistant.shuffled()
                boxOffice = boxOffice.shuffled()
                rest = rest.shuffled()
                localList = stageManager + socialMedia + frontOfHouse + orchestraAssistant + boxOffice + pianoAssistant + rest
                
                var localMorning: [Counselor?] = [nil, nil, nil, nil]
                var localAfternoon: [Counselor?] = [nil, nil, nil, nil]
                var localEvening: [Counselor?] = [nil, nil]
                var mondayAssigned = [Counselor]()
                
                var unspecificIndices = [Int]()
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                
                for counselor in localList {
                    
                    var availableIndices = [0, 1 ,2]
                    if sundayNightWatch.contains(counselor) {
                        
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                        
                    }
                    switch counselor.recreationPreferences {
                    case let role where counselor.roles.contains("Stage Manager"):
                        
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        
                        if auditionList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                                availableIndices.remove(at: idx)
                            }
                            // morning auditions
                        } else if auditionList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                            // afternoon auditions
                        } else if auditionList.value[day] == 3 {
                            //evening auditions
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else {
                            // no auditions
                        }
                        
                        //                        availableIndices = availableIndices.shuffled()
                        //                        //                        for i in availableIndices {
                        //                        //
                        //                        //                        }
                        //                        if localEvening[0] == nil {
                        //                            localEvening.insert(counselor, at: 0)
                        //                            masterList.value[day][3].counselors.insert(counselor, at: 0)
                        //                            sundayAssigned.append(counselor)
                        //                            break
                        //                        } else if localEvening[1] == nil {
                        //                            localEvening.insert(counselor, at: 1)
                        //                            masterList.value[day][3].counselors.insert(counselor, at: 1)
                        //                            sundayAssigned.append(counselor)
                        //                            break
                        //                        } else {
                        //                            var randomShift = [0, 1, 2, 3]
                        //                            randomShift = randomShift.shuffled()
                        //                            for i in randomShift {
                        //                                if localMorning[i] == nil {
                        //                                    localMorning.insert(counselor, at: i)
                        //                                    masterList.value[day][1].counselors.insert(counselor, at: i)
                        //                                    sundayAssigned.append(counselor)
                        //                                    break
                        //                                }
                        //                            }
                        //                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Front of House"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Orchestra Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
//                    case let role where counselor.roles.contains("Social Media Assistant"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                        
                    case let role where counselor.roles.contains("Box Office"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Piano TA"):
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    default:
//                        var availableShifts = [0, 1, 2]
                        var availableShifts = availableIndices.shuffled()
                        for i in availableShifts {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    }
                }
                mondaySupervisionList = mondaySupervisionList?.filter { counselor in
                    return !mondayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 2:
                var tuesdayList = tuesdaySupervisionList ?? []
                var tuesdayOff = tuesdayOffList ?? []
                var localList = [Counselor]()
                localList = tuesdayList.filter { counselor in
                    return !tuesdayOff.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
                //                localList = localList.shuffled()
                var stageManager = [Counselor]()
                var frontOfHouse = [Counselor]()
                var boxOffice = [Counselor]()
                var orchestraAssistant = [Counselor]()
                var socialMedia = [Counselor]()
                var rest = [Counselor]()
                var pianoAssistant = [Counselor]()
                for i in localList {
                    if i.roles.contains("Stage Manager") {
                        stageManager.append(i)
                    } else if i.roles.contains("Front of House") {
                        frontOfHouse.append(i)
                    } else if i.roles.contains("Box Office") {
                        boxOffice.append(i)
                    } else if i.roles.contains("Orchestra Assistant") {
                        orchestraAssistant.append(i)
                    } else if i.roles.contains("Social Media Assistant") {
                        socialMedia.append(i)
                    } else if i.roles.contains("Piano TA") {
                        pianoAssistant.append(i)
                    } else {
                        rest.append(i)
                    }
                }
                stageManager = stageManager.shuffled()
                socialMedia = socialMedia.shuffled()
                frontOfHouse = frontOfHouse.shuffled()
                orchestraAssistant = orchestraAssistant.shuffled()
                boxOffice = boxOffice.shuffled()
                rest = rest.shuffled()
                var leftover = socialMedia + frontOfHouse + boxOffice + rest
                leftover = leftover.shuffled()
                localList = stageManager + orchestraAssistant + leftover
                var localMorning: [Counselor?] = [nil, nil, nil, nil]
                var localAfternoon: [Counselor?] = [nil, nil, nil, nil]
                var localEvening: [Counselor?] = [nil, nil]
                var tuesdayAssigned = [Counselor]()
                
                var unspecificIndices = [Int]()
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                
                for counselor in localList {
                    var availableIndices = [0, 1 ,2]
                    if mondayNightWatch.contains(counselor) {
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                    }
                    switch counselor.recreationPreferences {
                    case let role where counselor.roles.contains("Stage Manager"):
//
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }

                        if auditionList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                                availableIndices.remove(at: idx)
                            }
                            // morning auditions
                        } else if auditionList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                            // afternoon auditions
                        } else if auditionList.value[day] == 3 {
                            //evening auditions
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else {
                            // no auditions
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
//                    case let role where counselor.roles.contains("Front of House"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                    case let role where counselor.roles.contains("Orchestra Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
//                    case let role where counselor.roles.contains("Social Media Assistant"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                        
//                    case let role where counselor.roles.contains("Box Office"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                    case let role where counselor.roles.contains("Piano TA"):
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    default:
//                        var availableShifts = [0, 1, 2]
                        var availableShifts = availableIndices.shuffled()
                        for i in availableShifts {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                            default:
                                print(i)
                            }
                            break
                        }
                    }
                }
                tuesdaySupervisionList = tuesdaySupervisionList?.filter { counselor in
                    return !tuesdayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 3:
                var wednesdayList = wednesdaySupervisionList ?? []
                var wednesdayOff = wednesdayOffList ?? []
                var localList = [Counselor]()
                localList = wednesdayList.filter { counselor in
                    return !wednesdayOff.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
                //                localList = localList.shuffled()
                var stageManager = [Counselor]()
                var frontOfHouse = [Counselor]()
                var boxOffice = [Counselor]()
                var orchestraAssistant = [Counselor]()
                var socialMedia = [Counselor]()
                var pianoAssistant = [Counselor]()
                var rest = [Counselor]()
                for i in localList {
                    if i.roles.contains("Stage Manager") {
                        stageManager.append(i)
                    } else if i.roles.contains("Front of House") {
                        frontOfHouse.append(i)
                    } else if i.roles.contains("Box Office") {
                        boxOffice.append(i)
                    } else if i.roles.contains("Orchestra Assistant") {
                        orchestraAssistant.append(i)
                    } else if i.roles.contains("Social Media Assistant") {
                        socialMedia.append(i)
                    } else if i.roles.contains("Piano TA"){
                        pianoAssistant.append(i)
                    } else {
                        rest.append(i)
                    }
                }
                stageManager = stageManager.shuffled()
                socialMedia = socialMedia.shuffled()
                frontOfHouse = frontOfHouse.shuffled()
                orchestraAssistant = orchestraAssistant.shuffled()
                boxOffice = boxOffice.shuffled()
                rest = rest.shuffled()
                var leftover = stageManager + socialMedia + frontOfHouse + boxOffice + rest
                leftover = leftover.shuffled()
                localList = orchestraAssistant + pianoAssistant + leftover
                var localMorning: [Counselor?] = [nil, nil, nil, nil]
                var localAfternoon: [Counselor?] = [nil, nil, nil, nil]
                var localEvening: [Counselor?] = [nil, nil]
                var wednesdayAssigned = [Counselor]()
                
                var unspecificIndices = [Int]()
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                
                for counselor in localList {
                    var availableIndices = [0, 1 ,2]
                    if tuesdayNightWatch.contains(counselor) {
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                    }
                    switch counselor.recreationPreferences {
//                    case let role where counselor.roles.contains("Stage Manager"):
//
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//
//                        if auditionList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                            // morning auditions
//                        } else if auditionList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                            // afternoon auditions
//                        } else if auditionList.value[day] == 3 {
//                            //evening auditions
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else {
//                            // no auditions
//                        }
//
//                        //                        availableIndices = availableIndices.shuffled()
//                        //                        //                        for i in availableIndices {
//                        //                        //
//                        //                        //                        }
//                        //                        if localEvening[0] == nil {
//                        //                            localEvening.insert(counselor, at: 0)
//                        //                            masterList.value[day][3].counselors.insert(counselor, at: 0)
//                        //                            sundayAssigned.append(counselor)
//                        //                            break
//                        //                        } else if localEvening[1] == nil {
//                        //                            localEvening.insert(counselor, at: 1)
//                        //                            masterList.value[day][3].counselors.insert(counselor, at: 1)
//                        //                            sundayAssigned.append(counselor)
//                        //                            break
//                        //                        } else {
//                        //                            var randomShift = [0, 1, 2, 3]
//                        //                            randomShift = randomShift.shuffled()
//                        //                            for i in randomShift {
//                        //                                if localMorning[i] == nil {
//                        //                                    localMorning.insert(counselor, at: i)
//                        //                                    masterList.value[day][1].counselors.insert(counselor, at: i)
//                        //                                    sundayAssigned.append(counselor)
//                        //                                    break
//                        //                                }
//                        //                            }
//                        //                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
//                    case let role where counselor.roles.contains("Front of House"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                    case let role where counselor.roles.contains("Orchestra Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
//                    case let role where counselor.roles.contains("Social Media Assistant"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                        
//                    case let role where counselor.roles.contains("Box Office"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                    case let role where counselor.roles.contains("Piano TA"):
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    default:
//                        var availableShifts = [0, 1, 2]
                        var availableShifts = availableIndices.shuffled()
                        for i in availableShifts {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    }
                }
                wednesdaySupervisionList = wednesdaySupervisionList?.filter { counselor in
                    return !wednesdayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 4:
                var thursdayList = thursdaySupervisionList ?? []
                var thursdayOff = thursdayOffList ?? []
                var localList = [Counselor]()
                localList = thursdayList.filter { counselor in
                    return !thursdayOff.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
                //                localList = localList.shuffled()
                var stageManager = [Counselor]()
                var frontOfHouse = [Counselor]()
                var boxOffice = [Counselor]()
                var orchestraAssistant = [Counselor]()
                var socialMedia = [Counselor]()
                var pianoAssistant = [Counselor]()
                var rest = [Counselor]()
                for i in localList {
                    if i.roles.contains("Stage Manager") {
                        stageManager.append(i)
                    } else if i.roles.contains("Front of House") {
                        frontOfHouse.append(i)
                    } else if i.roles.contains("Box Office") {
                        boxOffice.append(i)
                    } else if i.roles.contains("Orchestra Assistant") {
                        orchestraAssistant.append(i)
                    } else if i.roles.contains("Social Media Assistant") {
                        socialMedia.append(i)
                    } else if i.roles.contains("Piano TA"){
                        pianoAssistant.append(i)
                    } else {
                        rest.append(i)
                    }
                }
                stageManager = stageManager.shuffled()
                socialMedia = socialMedia.shuffled()
                frontOfHouse = frontOfHouse.shuffled()
                orchestraAssistant = orchestraAssistant.shuffled()
                boxOffice = boxOffice.shuffled()
                rest = rest.shuffled()
                var leftover = stageManager + socialMedia + frontOfHouse + boxOffice + rest
                leftover = leftover.shuffled()
                localList = orchestraAssistant + pianoAssistant + leftover
                var localMorning: [Counselor?] = [nil, nil, nil, nil]
                var localAfternoon: [Counselor?] = [nil, nil, nil, nil]
                var localEvening: [Counselor?] = [nil, nil]
                var thursdayAssigned = [Counselor]()
                
                var unspecificIndices = [Int]()
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                
                for counselor in localList {
                    var availableIndices = [0, 1 ,2]
                    if wednesdayNightWatch.contains(counselor) {
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                    }
                    switch counselor.recreationPreferences {
//                    case let role where counselor.roles.contains("Stage Manager"):
//
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//
//                        if auditionList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                            // morning auditions
//                        } else if auditionList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                            // afternoon auditions
//                        } else if auditionList.value[day] == 3 {
//                            //evening auditions
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else {
//                            // no auditions
//                        }
//
//                        //                        availableIndices = availableIndices.shuffled()
//                        //                        //                        for i in availableIndices {
//                        //                        //
//                        //                        //                        }
//                        //                        if localEvening[0] == nil {
//                        //                            localEvening.insert(counselor, at: 0)
//                        //                            masterList.value[day][3].counselors.insert(counselor, at: 0)
//                        //                            sundayAssigned.append(counselor)
//                        //                            break
//                        //                        } else if localEvening[1] == nil {
//                        //                            localEvening.insert(counselor, at: 1)
//                        //                            masterList.value[day][3].counselors.insert(counselor, at: 1)
//                        //                            sundayAssigned.append(counselor)
//                        //                            break
//                        //                        } else {
//                        //                            var randomShift = [0, 1, 2, 3]
//                        //                            randomShift = randomShift.shuffled()
//                        //                            for i in randomShift {
//                        //                                if localMorning[i] == nil {
//                        //                                    localMorning.insert(counselor, at: i)
//                        //                                    masterList.value[day][1].counselors.insert(counselor, at: i)
//                        //                                    sundayAssigned.append(counselor)
//                        //                                    break
//                        //                                }
//                        //                            }
//                        //                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
//                    case let role where counselor.roles.contains("Front of House"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                    case let role where counselor.roles.contains("Orchestra Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Social Media Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                        
//                    case let role where counselor.roles.contains("Box Office"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                    case let role where counselor.roles.contains("Piano TA"):
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    default:
//                        var availableShifts = [0, 1, 2]
                        var availableShifts = availableIndices.shuffled()
                        for i in availableShifts {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    }
                }
                thursdaySupervisionList = thursdaySupervisionList?.filter { counselor in
                    return !thursdayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 5:
                var fridayList = fridaySupervisionList ?? []
                var fridayOff = fridayOffList ?? []
                var localList = [Counselor]()
                localList = fridayList.filter { counselor in
                    return !fridayOff.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
                //                localList = localList.shuffled()
                var stageManager = [Counselor]()
                var frontOfHouse = [Counselor]()
                var boxOffice = [Counselor]()
                var orchestraAssistant = [Counselor]()
                var socialMedia = [Counselor]()
                var pianoAssistant = [Counselor]()
                var rest = [Counselor]()
                for i in localList {
                    if i.roles.contains("Stage Manager") {
                        stageManager.append(i)
                    } else if i.roles.contains("Front of House") {
                        frontOfHouse.append(i)
                    } else if i.roles.contains("Box Office") {
                        boxOffice.append(i)
                    } else if i.roles.contains("Orchestra Assistant") {
                        orchestraAssistant.append(i)
                    } else if i.roles.contains("Social Media Assistant") {
                        socialMedia.append(i)
                    } else if i.roles.contains("Piano TA"){
                        pianoAssistant.append(i)
                    } else {
                        rest.append(i)
                    }
                }
                stageManager = stageManager.shuffled()
                socialMedia = socialMedia.shuffled()
                frontOfHouse = frontOfHouse.shuffled()
                orchestraAssistant = orchestraAssistant.shuffled()
                boxOffice = boxOffice.shuffled()
                rest = rest.shuffled()
                localList = stageManager + socialMedia + frontOfHouse + orchestraAssistant + boxOffice + pianoAssistant + rest
                var localMorning: [Counselor?] = [nil, nil, nil, nil]
                var localAfternoon: [Counselor?] = [nil, nil, nil, nil]
                var localEvening: [Counselor?] = [nil, nil]
                var fridayAssigned = [Counselor]()
                
                var unspecificIndices = [Int]()
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                
                for counselor in localList {
                    var availableIndices = [0, 1 ,2]
                    if thursdayNightWatch.contains(counselor) {
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                    }
                    switch counselor.recreationPreferences {
                    case let role where counselor.roles.contains("Stage Manager"):
                        
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        
                        if auditionList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                                availableIndices.remove(at: idx)
                            }
                            // morning auditions
                        } else if auditionList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                            // afternoon auditions
                        } else if auditionList.value[day] == 3 {
                            //evening auditions
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else {
                            // no auditions
                        }
                        
                        //                        availableIndices = availableIndices.shuffled()
                        //                        //                        for i in availableIndices {
                        //                        //
                        //                        //                        }
                        //                        if localEvening[0] == nil {
                        //                            localEvening.insert(counselor, at: 0)
                        //                            masterList.value[day][3].counselors.insert(counselor, at: 0)
                        //                            sundayAssigned.append(counselor)
                        //                            break
                        //                        } else if localEvening[1] == nil {
                        //                            localEvening.insert(counselor, at: 1)
                        //                            masterList.value[day][3].counselors.insert(counselor, at: 1)
                        //                            sundayAssigned.append(counselor)
                        //                            break
                        //                        } else {
                        //                            var randomShift = [0, 1, 2, 3]
                        //                            randomShift = randomShift.shuffled()
                        //                            for i in randomShift {
                        //                                if localMorning[i] == nil {
                        //                                    localMorning.insert(counselor, at: i)
                        //                                    masterList.value[day][1].counselors.insert(counselor, at: i)
                        //                                    sundayAssigned.append(counselor)
                        //                                    break
                        //                                }
                        //                            }
                        //                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Front of House"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Orchestra Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Social Media Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                        
                    case let role where counselor.roles.contains("Box Office"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Piano TA"):
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    default:
//                        var availableShifts = [0, 1, 2]
                        var availableShifts = availableIndices.shuffled()
                        for i in availableShifts {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    }
                }
                fridaySupervisionList = fridaySupervisionList?.filter { counselor in
                    return !fridayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 6:
                var saturdayList = saturdaySupervisionList ?? []
                var saturdayOff = saturdayOffList ?? []
                var localList = [Counselor]()
                localList = saturdayList.filter { counselor in
                    return !saturdayOff.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
                //                localList = localList.shuffled()
                var stageManager = [Counselor]()
                var frontOfHouse = [Counselor]()
                var boxOffice = [Counselor]()
                var orchestraAssistant = [Counselor]()
                var socialMedia = [Counselor]()
                var pianoAssistant = [Counselor]()
                var rest = [Counselor]()
                for i in localList {
                    if i.roles.contains("Stage Manager") {
                        stageManager.append(i)
                    } else if i.roles.contains("Front of House") {
                        frontOfHouse.append(i)
                    } else if i.roles.contains("Box Office") {
                        boxOffice.append(i)
                    } else if i.roles.contains("Orchestra Assistant") {
                        orchestraAssistant.append(i)
                    } else if i.roles.contains("Social Media Assistant") {
                        socialMedia.append(i)
                    } else if i.roles.contains("Piano TA"){
                        pianoAssistant.append(i)
                    } else {
                        rest.append(i)
                    }
                }
                stageManager = stageManager.shuffled()
                socialMedia = socialMedia.shuffled()
                frontOfHouse = frontOfHouse.shuffled()
                orchestraAssistant = orchestraAssistant.shuffled()
                boxOffice = boxOffice.shuffled()
                rest = rest.shuffled()
                localList = stageManager + socialMedia + frontOfHouse + orchestraAssistant + boxOffice + rest
                var localMorning: [Counselor?] = [nil, nil, nil, nil]
                var localAfternoon: [Counselor?] = [nil, nil, nil, nil]
                var localEvening: [Counselor?] = [nil, nil]
                var saturdayAssigned = [Counselor]()
                
                var unspecificIndices = [Int]()
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                
                for counselor in localList {
                    var availableIndices = [0, 1 ,2]
                    if fridayNightWatch.contains(counselor) {
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                    }
                    switch counselor.recreationPreferences {
                    case let role where counselor.roles.contains("Stage Manager"):
                        
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        
                        if auditionList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                                availableIndices.remove(at: idx)
                            }
                            // morning auditions
                        } else if auditionList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                            // afternoon auditions
                        } else if auditionList.value[day] == 3 {
                            //evening auditions
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else {
                            // no auditions
                        }
                        
                        //                        availableIndices = availableIndices.shuffled()
                        //                        //                        for i in availableIndices {
                        //                        //
                        //                        //                        }
                        //                        if localEvening[0] == nil {
                        //                            localEvening.insert(counselor, at: 0)
                        //                            masterList.value[day][3].counselors.insert(counselor, at: 0)
                        //                            sundayAssigned.append(counselor)
                        //                            break
                        //                        } else if localEvening[1] == nil {
                        //                            localEvening.insert(counselor, at: 1)
                        //                            masterList.value[day][3].counselors.insert(counselor, at: 1)
                        //                            sundayAssigned.append(counselor)
                        //                            break
                        //                        } else {
                        //                            var randomShift = [0, 1, 2, 3]
                        //                            randomShift = randomShift.shuffled()
                        //                            for i in randomShift {
                        //                                if localMorning[i] == nil {
                        //                                    localMorning.insert(counselor, at: i)
                        //                                    masterList.value[day][1].counselors.insert(counselor, at: i)
                        //                                    sundayAssigned.append(counselor)
                        //                                    break
                        //                                }
                        //                            }
                        //                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Front of House"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Orchestra Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    case let role where counselor.roles.contains("Social Media Assistant"):
                        if concertList.value[day] == 1 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
                                availableIndices.remove(at: idx)
                            }
                        } else if concertList.value[day] == 2 {
                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
                                availableIndices.remove(at: idx)
                            }
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                        
//                    case let role where counselor.roles.contains("Box Office"):
//                        if concertList.value[day] == 1 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 1 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        } else if concertList.value[day] == 2 {
//                            if let idx = availableIndices.firstIndex(where: { $0 == 2 }) {
//                                availableIndices.remove(at: idx)
//                            }
//                        }
//                        var randomAvailable = availableIndices.shuffled()
//                        for i in randomAvailable {
//                            switch i {
//                            case 0:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localMorning.insert(counselor, at: i)
//                                        masterList.value[day][1].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 1:
//                                var randomShifts = [0, 1, 2, 3]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localAfternoon.insert(counselor, at: i)
//                                        masterList.value[day][2].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            case 2:
//                                var randomShifts = [0, 1]
//                                randomShifts = randomShifts.shuffled()
//                                for i in randomShifts {
//                                    if localMorning[i] == nil {
//                                        localEvening.insert(counselor, at: i)
//                                        masterList.value[day][3].counselors.insert(counselor, at: i)
//                                        mondayAssigned.append(counselor)
//                                        break
//                                    }
//                                }
//                            default:
//                                print(i)
//                            }
//                        }
                    case let role where counselor.roles.contains("Piano TA"):
                        if let idx = availableIndices.firstIndex(where: { $0 == 0 }) {
                            availableIndices.remove(at: idx)
                        }
                        var randomAvailable = availableIndices.shuffled()
                        for i in randomAvailable {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    default:
//                        var availableShifts = [0, 1, 2]
                        var availableShifts = availableIndices.shuffled()
                        for i in availableShifts {
                            switch i {
                            case 0:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localMorning[s] == nil {
                                        localMorning.insert(counselor, at: s)
                                        masterList.value[day][1].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 1:
                                var randomShifts = [0, 1, 2, 3]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localAfternoon[s] == nil {
                                        localAfternoon.insert(counselor, at: s)
                                        masterList.value[day][2].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            case 2:
                                var randomShifts = [0, 1]
                                randomShifts = randomShifts.shuffled()
                                for s in randomShifts {
                                    if localEvening[s] == nil {
                                        localEvening.insert(counselor, at: s)
                                        masterList.value[day][3].counselors[s] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    }
                                }
                                break
                            default:
                                print(i)
                            }
                            break
                        }
                    }
                }
                saturdaySupervisionList = saturdaySupervisionList?.filter { counselor in
                    return !saturdayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            default:
                print(day)
            }
        }
        delegate?.updateSupervisionShifts(sunday: sundaySupervisionList ?? [], monday: mondaySupervisionList ?? [], tuesday: tuesdaySupervisionList ?? [], wednesday: wednesdaySupervisionList ?? [], thursday: thursdaySupervisionList ?? [], friday: fridaySupervisionList ?? [], saturday: saturdaySupervisionList ?? [])
    }
    
    func assignRecShifts() {
        print("ASSIGN REC CALLED")
        clearRec()
        for day in 0...6 {
            switch day {
            case 0:
                var sundayList = sundayRecList ?? []
                var sundayOff = sundayOffList ?? []
                //                print("HERE IS THE REC LIST FOR SUNDAY \(sundayRecList)")
                //                localList = localList.filter( {!sundayOffList?.contains($0)} )
                var localList = [Counselor]()
                localList = sundayList.filter { counselor in
                    return !sundayOff.contains(where: {off in
                        return counselor.name == off.name
                    })
                }
                localList = localList.shuffled()
                var localActivity: [Counselor?] = [nil]
                var localArtsCrafts: [Counselor?] = [nil]
                var localSouthVillage: [Counselor?] = [nil]
                var localBeach: [Counselor?] = [nil,nil]
                var localStore: [Counselor?] = [nil]
                var localNorthPractice: [Counselor?] = [nil]
                var localSouthPractice: [Counselor?] = [nil]
                var localRoam: [Counselor?] = [nil]
                
                var sundayAssigned = [Counselor]()
                
                var unspecificIndices = [8, 9, 10, 11, 13, 14, 15]
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                for counselor in localList {
                    if counselor.roles.contains("Head Counselor") {
                        
                    } else {
                        switch counselor.roles {
                        case let _ where counselor.roles.contains("Camp Store"):
                            if localStore[0] == nil {
                                masterList.value[day][12] = Shift(counselors: [counselor])
                                localStore = [counselor]
                                sundayAssigned.append(counselor)
                                break
                            } else {
                                fallthrough
                            }
                        default:
                            switch counselor.recreationPreferences {
                            case let pref where counselor.recreationPreferences.contains("Arts & Crafts"):
                                if localArtsCrafts[0] == nil {
                                    localArtsCrafts = [counselor]
                                    masterList.value[day][9] = Shift(counselors: [counselor])
                                    sundayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Activity"):
                                if localActivity[0] == nil {
                                    localActivity = [counselor]
                                    masterList.value[day][8] = Shift(counselors: [counselor])
                                    sundayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Beach"):
                                if localBeach[0] == nil {
                                    localBeach[0] = counselor
                                    masterList.value[day][11].counselors[0] = counselor
                                    sundayAssigned.append(counselor)
                                    break
                                } else if localBeach[1] == nil {
                                    localBeach[1] = counselor
                                    masterList.value[day][11].counselors[1] = counselor
                                    sundayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            default:
                                
                                switch unspecificIndices[unspecificedIndex] {
                                case 8:
                                    if localActivity[0] == nil {
                                        localActivity = [counselor]
                                        masterList.value[day][8] = Shift(counselors: [counselor])
                                        sundayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 9:
                                    if localArtsCrafts[0] == nil {
                                        localArtsCrafts = [counselor]
                                        masterList.value[day][9] = Shift(counselors: [counselor])
                                        sundayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 10:
                                    if localSouthVillage[0] == nil {
                                        localSouthVillage = [counselor]
                                        masterList.value[day][10] = Shift(counselors: [counselor])
                                        sundayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 11:
                                    if localBeach[0] == nil {
                                        localBeach[0] = counselor
                                        masterList.value[day][11].counselors[0] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    } else if localBeach[1] == nil {
                                        localBeach[1] = counselor
                                        masterList.value[day][11].counselors[1] = counselor
                                        sundayAssigned.append(counselor)
                                        break
                                    } else {
                                        fallthrough
                                    }
                                case 13:
                                    if localNorthPractice[0] == nil {
                                        localNorthPractice = [counselor]
                                        masterList.value[day][13] = Shift(counselors: [counselor])
                                        sundayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 14:
                                    if localSouthPractice[0] == nil {
                                        localSouthPractice = [counselor]
                                        masterList.value[day][14] = Shift(counselors: [counselor])
                                        sundayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 15:
                                    if localRoam[0] == nil {
                                        localRoam = [counselor]
                                        masterList.value[day][15] = Shift(counselors: [counselor])
                                        sundayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                default:
                                    print("Couldn't place \(counselor.name) for a recreation assignment")
                                }
                                
                            }
                        }
                    }
                }
                sundayRecList = sundayRecList?.filter { counselor in
                    return !sundayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 1:
                
                var mondayList = mondayRecList ?? []
                var mondayOff = mondayOffList ?? []
                var localList = [Counselor]()
                localList = mondayList.filter { counselor in
                    return !mondayOff.contains(where: {off in
                        return counselor.name == off.name
                    })
                }
                localList = localList.shuffled()
                var localActivity: [Counselor?] = [nil]
                var localArtsCrafts: [Counselor?] = [nil]
                var localSouthVillage: [Counselor?] = [nil]
                var localBeach: [Counselor?] = [nil,nil]
                var localStore: [Counselor?] = [nil]
                var localNorthPractice: [Counselor?] = [nil]
                var localSouthPractice: [Counselor?] = [nil]
                var localRoam: [Counselor?] = [nil]
                
                var mondayAssigned = [Counselor]()
                
                var unspecificIndices = [8, 9, 10, 11, 13, 14, 15]
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                for counselor in localList {
                    if counselor.roles.contains("Head Counselor") {
                        
                    } else {
                        switch counselor.roles {
                        case let role where counselor.roles.contains("Camp Store"):
                            if localStore[0] == nil {
                                masterList.value[day][12] = Shift(counselors: [counselor])
                                localStore = [counselor]
                                mondayAssigned.append(counselor)
                                break
                            } else {
                                fallthrough
                            }
                        default:
                            switch counselor.recreationPreferences {
                            case let pref where counselor.recreationPreferences.contains("Arts & Crafts"):
                                if localArtsCrafts[0] == nil {
                                    localArtsCrafts = [counselor]
                                    masterList.value[day][9] = Shift(counselors: [counselor])
                                    mondayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Activity"):
                                if localActivity[0] == nil {
                                    localActivity = [counselor]
                                    masterList.value[day][8] = Shift(counselors: [counselor])
                                    mondayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Beach"):
                                if localBeach[0] == nil {
                                    localBeach[0] = counselor
                                    masterList.value[day][11].counselors[0] = counselor
                                    mondayAssigned.append(counselor)
                                    break
                                } else if localBeach[1] == nil {
                                    localBeach[1] = counselor
                                    masterList.value[day][11].counselors[1] = counselor
                                    mondayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            default:
                                
                                switch unspecificIndices[unspecificedIndex] {
                                case 8:
                                    if localActivity[0] == nil {
                                        localActivity = [counselor]
                                        masterList.value[day][8] = Shift(counselors: [counselor])
                                        mondayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 9:
                                    if localArtsCrafts[0] == nil {
                                        localArtsCrafts = [counselor]
                                        masterList.value[day][9] = Shift(counselors: [counselor])
                                        mondayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 10:
                                    if localSouthVillage[0] == nil {
                                        localSouthVillage = [counselor]
                                        masterList.value[day][10] = Shift(counselors: [counselor])
                                        mondayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 11:
                                    if localBeach[0] == nil {
                                        localBeach[0] = counselor
                                        masterList.value[day][11].counselors[0] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    } else if localBeach[1] == nil {
                                        localBeach[1] = counselor
                                        masterList.value[day][11].counselors[1] = counselor
                                        mondayAssigned.append(counselor)
                                        break
                                    } else {
                                        fallthrough
                                    }
                                case 13:
                                    if localNorthPractice[0] == nil {
                                        localNorthPractice = [counselor]
                                        masterList.value[day][13] = Shift(counselors: [counselor])
                                        mondayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 14:
                                    if localSouthPractice[0] == nil {
                                        localSouthPractice = [counselor]
                                        masterList.value[day][14] = Shift(counselors: [counselor])
                                        mondayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 15:
                                    if localRoam[0] == nil {
                                        localRoam = [counselor]
                                        masterList.value[day][15] = Shift(counselors: [counselor])
                                        mondayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                default:
                                    print("Couldn't place \(counselor.name) for a recreation assignment")
                                }
                                
                            }
                        }
                    }
                }
                mondayRecList = mondayRecList?.filter { counselor in
                    return !mondayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 2:
                var tuesdayList = tuesdayRecList ?? []
                var tuesdayOff = tuesdayOffList ?? []
                var localList = [Counselor]()
                localList = tuesdayList.filter { counselor in
                    return !tuesdayOff.contains(where: {off in
                        return counselor.name == off.name
                    })
                }
                localList = localList.shuffled()
                var localActivity: [Counselor?] = [nil]
                var localArtsCrafts: [Counselor?] = [nil]
                var localSouthVillage: [Counselor?] = [nil]
                var localBeach: [Counselor?] = [nil,nil]
                var localStore: [Counselor?] = [nil]
                var localNorthPractice: [Counselor?] = [nil]
                var localSouthPractice: [Counselor?] = [nil]
                var localRoam: [Counselor?] = [nil]
                
                var tuesdayAssigned = [Counselor]()
                
                var unspecificIndices = [8, 9, 10, 11, 13, 14, 15]
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                for counselor in localList {
                    if counselor.roles.contains("Head Counselor") {
                        
                    } else {
                        switch counselor.roles {
                        case let role where counselor.roles.contains("Camp Store"):
                            if localStore[0] == nil {
                                masterList.value[day][12] = Shift(counselors: [counselor])
                                localStore = [counselor]
                                tuesdayAssigned.append(counselor)
                                break
                            } else {
                                fallthrough
                            }
                        default:
                            switch counselor.recreationPreferences {
                            case let pref where counselor.recreationPreferences.contains("Arts & Crafts"):
                                if localArtsCrafts[0] == nil {
                                    localArtsCrafts = [counselor]
                                    masterList.value[day][9] = Shift(counselors: [counselor])
                                    tuesdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Activity"):
                                if localActivity[0] == nil {
                                    localActivity = [counselor]
                                    masterList.value[day][8] = Shift(counselors: [counselor])
                                    tuesdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Beach"):
                                if localBeach[0] == nil {
                                    localBeach[0] = counselor
                                    masterList.value[day][11].counselors[0] = counselor
                                    tuesdayAssigned.append(counselor)
                                    break
                                } else if localBeach[1] == nil {
                                    localBeach[1] = counselor
                                    masterList.value[day][11].counselors[1] = counselor
                                    tuesdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            default:
                                
                                switch unspecificIndices[unspecificedIndex] {
                                case 8:
                                    if localActivity[0] == nil {
                                        localActivity = [counselor]
                                        masterList.value[day][8] = Shift(counselors: [counselor])
                                        tuesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 9:
                                    if localArtsCrafts[0] == nil {
                                        localArtsCrafts = [counselor]
                                        masterList.value[day][9] = Shift(counselors: [counselor])
                                        tuesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 10:
                                    if localSouthVillage[0] == nil {
                                        localSouthVillage = [counselor]
                                        masterList.value[day][10] = Shift(counselors: [counselor])
                                        tuesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 11:
                                    if localBeach[0] == nil {
                                        localBeach[0] = counselor
                                        masterList.value[day][11].counselors[0] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    } else if localBeach[1] == nil {
                                        localBeach[1] = counselor
                                        masterList.value[day][11].counselors[1] = counselor
                                        tuesdayAssigned.append(counselor)
                                        break
                                    } else {
                                        fallthrough
                                    }
                                case 13:
                                    if localNorthPractice[0] == nil {
                                        localNorthPractice = [counselor]
                                        masterList.value[day][13] = Shift(counselors: [counselor])
                                        tuesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 14:
                                    if localSouthPractice[0] == nil {
                                        localSouthPractice = [counselor]
                                        masterList.value[day][14] = Shift(counselors: [counselor])
                                        tuesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 15:
                                    if localRoam[0] == nil {
                                        localRoam = [counselor]
                                        masterList.value[day][15] = Shift(counselors: [counselor])
                                        tuesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                default:
                                    print("Couldn't place \(counselor.name) for a recreation assignment")
                                }
                                
                            }
                        }
                    }
                }
                tuesdayRecList = tuesdayRecList?.filter { counselor in
                    return !tuesdayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 3:
                var wednesdayList = wednesdayRecList ?? []
                var wednesdayOff = wednesdayOffList ?? []
                var localList = [Counselor]()
                localList = wednesdayList.filter { counselor in
                    return !wednesdayOff.contains(where: {off in
                        return counselor.name == off.name
                    })
                }
                localList = localList.shuffled()
                var localActivity: [Counselor?] = [nil]
                var localArtsCrafts: [Counselor?] = [nil]
                var localSouthVillage: [Counselor?] = [nil]
                var localBeach: [Counselor?] = [nil,nil]
                var localStore: [Counselor?] = [nil]
                var localNorthPractice: [Counselor?] = [nil]
                var localSouthPractice: [Counselor?] = [nil]
                var localRoam: [Counselor?] = [nil]
                
                var wednesdayAssigned = [Counselor]()
                
                var unspecificIndices = [8, 9, 10, 11, 13, 14, 15]
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                for counselor in localList {
                    if counselor.roles.contains("Head Counselor") {
                        
                    } else {
                        switch counselor.roles {
                        case let role where counselor.roles.contains("Camp Store"):
                            if localStore[0] == nil {
                                masterList.value[day][12] = Shift(counselors: [counselor])
                                localStore = [counselor]
                                wednesdayAssigned.append(counselor)
                                break
                            } else {
                                fallthrough
                            }
                        default:
                            switch counselor.recreationPreferences {
                            case let pref where counselor.recreationPreferences.contains("Arts & Crafts"):
                                if localArtsCrafts[0] == nil {
                                    localArtsCrafts = [counselor]
                                    masterList.value[day][9] = Shift(counselors: [counselor])
                                    wednesdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Activity"):
                                if localActivity[0] == nil {
                                    localActivity = [counselor]
                                    masterList.value[day][8] = Shift(counselors: [counselor])
                                    wednesdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Beach"):
                                if localBeach[0] == nil {
                                    localBeach[0] = counselor
                                    masterList.value[day][11].counselors[0] = counselor
                                    wednesdayAssigned.append(counselor)
                                    break
                                } else if localBeach[1] == nil {
                                    localBeach[1] = counselor
                                    masterList.value[day][11].counselors[1] = counselor
                                    wednesdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            default:
                                
                                switch unspecificIndices[unspecificedIndex] {
                                case 8:
                                    if localActivity[0] == nil {
                                        localActivity = [counselor]
                                        masterList.value[day][8] = Shift(counselors: [counselor])
                                        wednesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 9:
                                    if localArtsCrafts[0] == nil {
                                        localArtsCrafts = [counselor]
                                        masterList.value[day][9] = Shift(counselors: [counselor])
                                        wednesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 10:
                                    if localSouthVillage[0] == nil {
                                        localSouthVillage = [counselor]
                                        masterList.value[day][10] = Shift(counselors: [counselor])
                                        wednesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 11:
                                    if localBeach[0] == nil {
                                        localBeach[0] = counselor
                                        masterList.value[day][11].counselors[0] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    } else if localBeach[1] == nil {
                                        localBeach[1] = counselor
                                        masterList.value[day][11].counselors[1] = counselor
                                        wednesdayAssigned.append(counselor)
                                        break
                                    } else {
                                        fallthrough
                                    }
                                case 13:
                                    if localNorthPractice[0] == nil {
                                        localNorthPractice = [counselor]
                                        masterList.value[day][13] = Shift(counselors: [counselor])
                                        wednesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 14:
                                    if localSouthPractice[0] == nil {
                                        localSouthPractice = [counselor]
                                        masterList.value[day][14] = Shift(counselors: [counselor])
                                        wednesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 15:
                                    if localRoam[0] == nil {
                                        localRoam = [counselor]
                                        masterList.value[day][15] = Shift(counselors: [counselor])
                                        wednesdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                default:
                                    print("Couldn't place \(counselor.name) for a recreation assignment")
                                }
                                
                            }
                        }
                    }
                }
                wednesdayRecList = wednesdayRecList?.filter { counselor in
                    return !wednesdayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 4:
                var thursdayList = thursdayRecList ?? []
                var thursdayOffList = thursdayOffList ?? []
                var localList = [Counselor]()
                localList = thursdayList.filter { counselor in
                    return !thursdayOffList.contains(where: {off in
                        return counselor.name == off.name
                    })
                }
                localList = localList.shuffled()
                var localActivity: [Counselor?] = [nil]
                var localArtsCrafts: [Counselor?] = [nil]
                var localSouthVillage: [Counselor?] = [nil]
                var localBeach: [Counselor?] = [nil,nil]
                var localStore: [Counselor?] = [nil]
                var localNorthPractice: [Counselor?] = [nil]
                var localSouthPractice: [Counselor?] = [nil]
                var localRoam: [Counselor?] = [nil]
                
                var thursdayAssigned = [Counselor]()
                
                var unspecificIndices = [8, 9, 10, 11, 13, 14, 15]
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                for counselor in localList {
                    if counselor.roles.contains("Head Counselor") {
                        
                    } else {
                        switch counselor.roles {
                        case let role where counselor.roles.contains("Camp Store"):
                            if localStore[0] == nil {
                                masterList.value[day][12] = Shift(counselors: [counselor])
                                localStore = [counselor]
                                thursdayAssigned.append(counselor)
                                break
                            } else {
                                fallthrough
                            }
                        default:
                            switch counselor.recreationPreferences {
                            case let pref where counselor.recreationPreferences.contains("Arts & Crafts"):
                                if localArtsCrafts[0] == nil {
                                    localArtsCrafts = [counselor]
                                    masterList.value[day][9] = Shift(counselors: [counselor])
                                    thursdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Activity"):
                                if localActivity[0] == nil {
                                    localActivity = [counselor]
                                    masterList.value[day][8] = Shift(counselors: [counselor])
                                    thursdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Beach"):
                                if localBeach[0] == nil {
                                    localBeach[0] = counselor
                                    masterList.value[day][11].counselors[0] = counselor
                                    thursdayAssigned.append(counselor)
                                    break
                                } else if localBeach[1] == nil {
                                    localBeach[1] = counselor
                                    masterList.value[day][11].counselors[1] = counselor
                                    thursdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            default:
                                
                                switch unspecificIndices[unspecificedIndex] {
                                case 8:
                                    if localActivity[0] == nil {
                                        localActivity = [counselor]
                                        masterList.value[day][8] = Shift(counselors: [counselor])
                                        thursdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 9:
                                    if localArtsCrafts[0] == nil {
                                        localArtsCrafts = [counselor]
                                        masterList.value[day][9] = Shift(counselors: [counselor])
                                        thursdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 10:
                                    if localSouthVillage[0] == nil {
                                        localSouthVillage = [counselor]
                                        masterList.value[day][10] = Shift(counselors: [counselor])
                                        thursdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 11:
                                    if localBeach[0] == nil {
                                        localBeach[0] = counselor
                                        masterList.value[day][11].counselors[0] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    } else if localBeach[1] == nil {
                                        localBeach[1] = counselor
                                        masterList.value[day][11].counselors[1] = counselor
                                        thursdayAssigned.append(counselor)
                                        break
                                    } else {
                                        fallthrough
                                    }
                                case 13:
                                    if localNorthPractice[0] == nil {
                                        localNorthPractice = [counselor]
                                        masterList.value[day][13] = Shift(counselors: [counselor])
                                        thursdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 14:
                                    if localSouthPractice[0] == nil {
                                        localSouthPractice = [counselor]
                                        masterList.value[day][14] = Shift(counselors: [counselor])
                                        thursdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 15:
                                    if localRoam[0] == nil {
                                        localRoam = [counselor]
                                        masterList.value[day][15] = Shift(counselors: [counselor])
                                        thursdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                default:
                                    print("Couldn't place \(counselor.name) for a recreation assignment")
                                }
                                
                            }
                        }
                    }
                }
                thursdayRecList = thursdayRecList?.filter { counselor in
                    return !thursdayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 5:
                var fridayList = fridayRecList ?? []
                var fridayOff = fridayOffList ?? []
                var localList = [Counselor]()
                localList = fridayList.filter { counselor in
                    return !fridayOff.contains(where: {off in
                        return counselor.name == off.name
                    })
                }
                localList = localList.shuffled()
                var localActivity: [Counselor?] = [nil]
                var localArtsCrafts: [Counselor?] = [nil]
                var localSouthVillage: [Counselor?] = [nil]
                var localBeach: [Counselor?] = [nil,nil]
                var localStore: [Counselor?] = [nil]
                var localNorthPractice: [Counselor?] = [nil]
                var localSouthPractice: [Counselor?] = [nil]
                var localRoam: [Counselor?] = [nil]
                
                var fridayAssigned = [Counselor]()
                
                var unspecificIndices = [8, 9, 10, 11, 13, 14, 15]
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                for counselor in localList {
                    if counselor.roles.contains("Head Counselor") {
                        
                    } else {
                        switch counselor.roles {
                        case let role where counselor.roles.contains("Camp Store"):
                            if localStore[0] == nil {
                                masterList.value[day][12] = Shift(counselors: [counselor])
                                localStore = [counselor]
                                fridayAssigned.append(counselor)
                                break
                            } else {
                                fallthrough
                            }
                        default:
                            switch counselor.recreationPreferences {
                            case let pref where counselor.recreationPreferences.contains("Arts & Crafts"):
                                if localArtsCrafts[0] == nil {
                                    localArtsCrafts = [counselor]
                                    masterList.value[day][9] = Shift(counselors: [counselor])
                                    fridayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Activity"):
                                if localActivity[0] == nil {
                                    localActivity = [counselor]
                                    masterList.value[day][8] = Shift(counselors: [counselor])
                                    fridayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Beach"):
                                if localBeach[0] == nil {
                                    localBeach[0] = counselor
                                    masterList.value[day][11].counselors[0] = counselor
                                    fridayAssigned.append(counselor)
                                    break
                                } else if localBeach[1] == nil {
                                    localBeach[1] = counselor
                                    masterList.value[day][11].counselors[1] = counselor
                                    fridayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            default:
                                
                                switch unspecificIndices[unspecificedIndex] {
                                case 8:
                                    if localActivity[0] == nil {
                                        localActivity = [counselor]
                                        masterList.value[day][8] = Shift(counselors: [counselor])
                                        fridayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 9:
                                    if localArtsCrafts[0] == nil {
                                        localArtsCrafts = [counselor]
                                        masterList.value[day][9] = Shift(counselors: [counselor])
                                        fridayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 10:
                                    if localSouthVillage[0] == nil {
                                        localSouthVillage = [counselor]
                                        masterList.value[day][10] = Shift(counselors: [counselor])
                                        fridayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 11:
                                    if localBeach[0] == nil {
                                        localBeach[0] = counselor
                                        masterList.value[day][11].counselors[0] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    } else if localBeach[1] == nil {
                                        localBeach[1] = counselor
                                        masterList.value[day][11].counselors[1] = counselor
                                        fridayAssigned.append(counselor)
                                        break
                                    } else {
                                        fallthrough
                                    }
                                case 13:
                                    if localNorthPractice[0] == nil {
                                        localNorthPractice = [counselor]
                                        masterList.value[day][13] = Shift(counselors: [counselor])
                                        fridayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 14:
                                    if localSouthPractice[0] == nil {
                                        localSouthPractice = [counselor]
                                        masterList.value[day][14] = Shift(counselors: [counselor])
                                        fridayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 15:
                                    if localRoam[0] == nil {
                                        localRoam = [counselor]
                                        masterList.value[day][15] = Shift(counselors: [counselor])
                                        fridayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                default:
                                    print("Couldn't place \(counselor.name) for a recreation assignment")
                                }
                                
                            }
                        }
                    }
                }
                fridayRecList = fridayRecList?.filter { counselor in
                    return !fridayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            case 6:
                var saturdayList = saturdayRecList ?? []
                var saturdayOff = saturdayOffList ?? []
                var localList = [Counselor]()
                localList = saturdayList.filter { counselor in
                    return !saturdayOff.contains(where: {off in
                        return counselor.name == off.name
                    })
                }
                localList = localList.shuffled()
                var localActivity: [Counselor?] = [nil]
                var localArtsCrafts: [Counselor?] = [nil]
                var localSouthVillage: [Counselor?] = [nil]
                var localBeach: [Counselor?] = [nil,nil]
                var localStore: [Counselor?] = [nil]
                var localNorthPractice: [Counselor?] = [nil]
                var localSouthPractice: [Counselor?] = [nil]
                var localRoam: [Counselor?] = [nil]
                
                var saturdayAssigned = [Counselor]()
                
                var unspecificIndices = [8, 9, 10, 11, 13, 14, 15]
                unspecificIndices = unspecificIndices.shuffled()
                var unspecificedIndex = 0
                for counselor in localList {
                    if counselor.roles.contains("Head Counselor") {
                        
                    } else {
                        switch counselor.roles {
                        case let role where counselor.roles.contains("Camp Store"):
                            if localStore[0] == nil {
                                masterList.value[day][12] = Shift(counselors: [counselor])
                                localStore = [counselor]
                                saturdayAssigned.append(counselor)
                                break
                            } else {
                                fallthrough
                            }
                        default:
                            switch counselor.recreationPreferences {
                            case let pref where counselor.recreationPreferences.contains("Arts & Crafts"):
                                if localArtsCrafts[0] == nil {
                                    localArtsCrafts = [counselor]
                                    masterList.value[day][9] = Shift(counselors: [counselor])
                                    saturdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Activity"):
                                if localActivity[0] == nil {
                                    localActivity = [counselor]
                                    masterList.value[day][8] = Shift(counselors: [counselor])
                                    saturdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            case let pref where counselor.recreationPreferences.contains("Beach"):
                                if localBeach[0] == nil {
                                    localBeach[0] = counselor
                                    masterList.value[day][11].counselors[0] = counselor
                                    saturdayAssigned.append(counselor)
                                    break
                                } else if localBeach[1] == nil {
                                    localBeach[1] = counselor
                                    masterList.value[day][11].counselors[1] = counselor
                                    saturdayAssigned.append(counselor)
                                    break
                                } else {
                                    fallthrough
                                }
                            default:
                                
                                switch unspecificIndices[unspecificedIndex] {
                                case 8:
                                    if localActivity[0] == nil {
                                        localActivity = [counselor]
                                        masterList.value[day][8] = Shift(counselors: [counselor])
                                        saturdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 9:
                                    if localArtsCrafts[0] == nil {
                                        localArtsCrafts = [counselor]
                                        masterList.value[day][9] = Shift(counselors: [counselor])
                                        saturdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 10:
                                    if localSouthVillage[0] == nil {
                                        localSouthVillage = [counselor]
                                        masterList.value[day][10] = Shift(counselors: [counselor])
                                        saturdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 11:
                                    if localBeach[0] == nil {
                                        localBeach[0] = counselor
                                        masterList.value[day][11].counselors[0] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    } else if localBeach[1] == nil {
                                        localBeach[1] = counselor
                                        masterList.value[day][11].counselors[1] = counselor
                                        saturdayAssigned.append(counselor)
                                        break
                                    } else {
                                        fallthrough
                                    }
                                case 13:
                                    if localNorthPractice[0] == nil {
                                        localNorthPractice = [counselor]
                                        masterList.value[day][13] = Shift(counselors: [counselor])
                                        saturdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 14:
                                    if localSouthPractice[0] == nil {
                                        localSouthPractice = [counselor]
                                        masterList.value[day][14] = Shift(counselors: [counselor])
                                        saturdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                case 15:
                                    if localRoam[0] == nil {
                                        localRoam = [counselor]
                                        masterList.value[day][15] = Shift(counselors: [counselor])
                                        saturdayAssigned.append(counselor)
                                        if unspecificedIndex < 6 {
                                            unspecificedIndex += 1
                                        } else {
                                            unspecificedIndex = 0
                                        }
                                    } else {
                                        fallthrough
                                    }
                                default:
                                    print("Couldn't place \(counselor.name) for a recreation assignment")
                                }
                                
                            }
                        }
                    }
                }
                saturdayRecList = saturdayRecList?.filter { counselor in
                    return !saturdayAssigned.contains(where: { off in
                        return counselor.name == off.name
                    })
                }
            default:
                print(day)
            }
            
        }
        delegate?.updateRecLists(sunday: sundayRecList ?? [], monday: mondayRecList ?? [], tuesday: tuesdayRecList ?? [], wednesday: wednesdayRecList ?? [], thursday: thursdayRecList ?? [], friday: fridayRecList ?? [], saturday: saturdayRecList ?? [])
    }
    
    func recShiftPreferences() {
        
    }
    
    func counselorConflict() {
        clearNightwatch()
        assignNightwatch()
    }
    
    func clearNightwatch() {
        //        print("CLEARING NIGHTWATCH")
        sundayNightWatch = [nil,nil]
        mondayNightWatch = [nil,nil]
        tuesdayNightWatch = [nil,nil]
        wednesdayNightWatch = [nil,nil]
        thursdayNightWatch = [nil,nil]
        fridayNightWatch = [nil,nil]
        saturdayNightWatch = [nil,nil]
        for i in 0...6 {
            switch i {
            case 0:
                masterList.value[i][5] = Shift(counselors: sundayNightWatch)
            case 1:
                masterList.value[i][5] = Shift(counselors: mondayNightWatch)
            case 2:
                masterList.value[i][5] = Shift(counselors: tuesdayNightWatch)
            case 3:
                masterList.value[i][5] = Shift(counselors: wednesdayNightWatch)
            case 4:
                masterList.value[i][5] = Shift(counselors: thursdayNightWatch)
            case 5:
                masterList.value[i][5] = Shift(counselors: fridayNightWatch)
            case 6:
                masterList.value[i][5] = Shift(counselors: saturdayNightWatch)
            default:
                print("Could not reset")
            }
        }
    }
    
    func insertCounselors(indexPath: IndexPath, counselors: [Counselor?]) {
        masterList.value[indexPath.row][indexPath.section].counselors = counselors
    }
    
    func populateSchedule() {
        assignNightwatch()
        //        assignRecShifts()
        //        print("Populationg \(concertList.value)")
        //        print("BIG OL LIST \(masterList.value)")
    }
}
