//
//  ShiftCollectionViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 6/21/22.
//

import UIKit

class ShiftCollectionViewCell: UICollectionViewCell {
    @IBOutlet var shiftLabel: UILabel! {
        didSet {
            shiftLabel.numberOfLines = 2
        }
    }
    @IBOutlet var recShiftLabel: UILabel!
    
}
