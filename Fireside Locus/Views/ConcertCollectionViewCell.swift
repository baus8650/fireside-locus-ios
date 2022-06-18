//
//  ConcertCollectionViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/30/22.
//

import UIKit

class ConcertCollectionViewCell: UICollectionViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var concertSelector: UISegmentedControl! {
        didSet {
//            concertSelector.selectedSegmentIndex = 0
        }
    }
    @IBOutlet var auditionSelector: UISegmentedControl! {
        didSet {
//            auditionSelector.selectedSegmentIndex = 0
        }
    }
    @IBAction func concertPressed(_ sender: Any) {
        
    }
    
    
}
