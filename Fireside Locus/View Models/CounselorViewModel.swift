//
//  CounselorViewModel.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/22/22.
//

import CoreData
import Foundation
import UIKit

class CounselorViewModel {
    
    var context: NSManagedObjectContext!
    var counselors: Binder<[NSManagedObject]> = Binder([NSManagedObject]())
    var counselorList: Binder<[Counselor]> = Binder([Counselor]())

    
    init() {
        setUpCoreData()
        fetchCounselors()
    }
    
    func setUpCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func fetchCounselors() {
        Auth().fetchCounselors()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CounselorModel")
        do {
            self.counselors.value = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        populateCounselors(counselors: self.counselors.value)
    }
    
    func populateCounselors(counselors: [NSManagedObject]) {
        self.counselorList.value = []
        for counselor in counselors {
            self.counselorList.value.append(Counselor(name: counselor.value(forKey: "name") as! String, cabin: counselor.value(forKey: "cabin") as! String, year: counselor.value(forKey: "year") as! Int, instrument: counselor.value(forKey: "instrument") as! String, nightwatchPreferences: counselor.value(forKey: "nightwatchPreferences") as! [String], recreationPreferences: counselor.value(forKey: "recreationPreferences") as! [String], roles: counselor.value(forKey: "roles") as! [String]))
        }
    }
}
