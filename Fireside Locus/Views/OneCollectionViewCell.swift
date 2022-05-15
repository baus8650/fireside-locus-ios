//
//  OneCollectionViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/28/22.
//

import UIKit

class OneCollectionViewCell: UICollectionViewCell {
    @IBOutlet var positionOneLabel: UILabel!
    @IBOutlet var cellBody: UIView! {
        didSet {
            cellBody.layer.borderColor = UIColor(named: "borderColor")?.cgColor
            cellBody.layer.borderWidth = 3
        }
    }
    
    @IBOutlet var counselorOne: UILabel!
}
