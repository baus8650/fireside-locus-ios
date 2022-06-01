//
//  ThreeCollectionViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 5/31/22.
//

import UIKit

class ThreeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var counselorOne: UILabel!
    @IBOutlet var counselorTwo: UILabel!
    @IBOutlet var counselorThree: UILabel!
    @IBOutlet var viewOne: UIView! {
        didSet{
            viewOne.layer.borderColor = UIColor(named: "borderColor")?.cgColor
            viewOne.layer.borderWidth = 1
        }
    }
    @IBOutlet var viewTwo: UIView! {
        didSet{
            viewTwo.layer.borderColor = UIColor(named: "borderColor")?.cgColor
            viewTwo.layer.borderWidth = 1
        }
    }
    @IBOutlet var viewThree: UIView! {
        didSet{
            viewThree.layer.borderColor = UIColor(named: "borderColor")?.cgColor
            viewThree.layer.borderWidth = 1
        }
    }
    @IBOutlet var cellBody: UIView! {
        didSet {
            cellBody.layer.borderColor = UIColor(named: "borderColor")?.cgColor
            cellBody.layer.borderWidth = 3
        }
    }
}
