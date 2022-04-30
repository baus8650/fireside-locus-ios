//
//  ShiftViewModel.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/29/22.
//

import Foundation

class ShiftViewModel {
    var masterList: Binder<[[Shift]]> = Binder(
        [
            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])],
            [Shift(counselors: []), Shift(counselors: ["","","",""]), Shift(counselors: ["","","",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: ["",""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""]), Shift(counselors: [""])]
        ]
    )
    
    func insertCounselors(indexPath: IndexPath, counselors: [String]) {
        masterList.value[indexPath.row][indexPath.section].counselors = counselors
    }
}
