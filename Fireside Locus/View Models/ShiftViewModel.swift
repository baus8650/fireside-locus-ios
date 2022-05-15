//
//  ShiftViewModel.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/29/22.
//

import Foundation

class ShiftViewModel {
//    var masterList: Binder<[[Shift]]> = Binder(
//        [
//            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
//            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
//            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
//            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
//            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
//            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
//            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])]
//        ]
//    )
    
    var masterList: Binder<[[Shift]]> = Binder(
        [
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])],
            [Shift(counselors: []), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil,nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil,nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil]), Shift(counselors: [nil])]
        ]
    )
    
    func insertCounselors(indexPath: IndexPath, counselors: [Counselor?]) {
        masterList.value[indexPath.row][indexPath.section].counselors = counselors
    }
    
    func populateSchedule() {
        
    }
}
