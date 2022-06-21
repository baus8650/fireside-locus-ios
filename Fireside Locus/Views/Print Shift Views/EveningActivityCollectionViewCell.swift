//
//  EveningActivityCollectionViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 6/21/22.
//

import UIKit

class EveningActivityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var eveningActivity: UITextView! {
        didSet {
            eveningActivity.text = ""
        }
    }
}
