//
//  TwoCollectionViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/28/22.
//

import UIKit

class TwoCollectionViewCell: UICollectionViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var positionOneView: UIView! {
        didSet {
            positionOneView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
            positionOneView.layer.borderWidth = 1
        }
    }
        @IBOutlet var positionTwoView: UIView! {
            didSet {
                positionTwoView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
                positionTwoView.layer.borderWidth = 1
            }
        }
    @IBOutlet var cellBody: UIView! {
        didSet {
            cellBody.layer.borderColor = UIColor(named: "borderColor")?.cgColor
            cellBody.layer.borderWidth = 3
        }
    }
    
    @IBOutlet var positionOneLabel: UILabel!
    @IBOutlet var positionTwoLabel: UILabel!
    @IBOutlet var counselorOne: UILabel!
    @IBOutlet var counselorTwo: UILabel!
    
}
