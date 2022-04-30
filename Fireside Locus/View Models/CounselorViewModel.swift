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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CamperModel")
        do {
            self.counselors.value = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
}
