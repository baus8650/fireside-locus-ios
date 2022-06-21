//
//  RecShiftCollectionViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 6/21/22.
//

import UIKit

class RecShiftCollectionViewCell: UICollectionViewCell {
    @IBOutlet var shiftLabel: UILabel! {
        didSet{
            shiftLabel.numberOfLines = 2
        }
    }
    
}
