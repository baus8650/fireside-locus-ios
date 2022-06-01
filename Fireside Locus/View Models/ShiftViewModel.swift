//
//  ShiftViewModel.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/29/22.
//

import Foundation

class ShiftViewModel {
    
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
    
    var masterNightwatch: [[Counselor]?]?
    var masterDaysOff: [[Counselor]?]?
    
    var concertList: Binder<[Int]> = Binder([0,0,0,0,0,0,0])
    
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
    
    func compileSingleLists() {
        masterNightwatch = [sundayNightWatch, mondayNightWatch, tuesdayNightWatch, wednesdayNightWatch, thursdayNightWatch, fridayNightWatch, saturdayNightWatch]
        masterDaysOff = [sundayOffList, mondayOffList, tuesdayOffList, wednesdayOffList, thursdayOffList, fridayOffList, saturdayOffList]
    }
    
    func insertCounselors(indexPath: IndexPath, counselors: [Counselor?]) {
        masterList.value[indexPath.row][indexPath.section].counselors = counselors
    }
    
    func populateSchedule() {
        print("Populationg \(concertList.value)")
        print("BIG OL LIST \(masterList.value)")
    }
}
