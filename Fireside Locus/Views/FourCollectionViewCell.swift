//
//  FourCollectionViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/28/22.
//

import UIKit

class FourCollectionViewCell: UICollectionViewCell {
    @IBOutlet var timeTitle: UILabel!
    @IBOutlet var positionOneTitle: UILabel!
    @IBOutlet var positionTwoTitle: UILabel!
    @IBOutlet var positionThreeTitle: UILabel!
    @IBOutlet var positionFourTitle: UILabel!
    
    @IBOutlet var positionOneView: UIView! {
        didSet {
            positionOneView.layer.borderWidth = 1
            positionOneView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
//            positionOneView.backgroundColor = .clear
        }
    }
    @IBOutlet var positionTwoView: UIView! {
        didSet {
            positionTwoView.layer.borderWidth = 1
            positionTwoView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
//            positionTwoView.backgroundColor = .clear
        }
    }
    @IBOutlet var positionThreeView: UIView! {
        didSet {
            positionThreeView.layer.borderWidth = 1
            positionThreeView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
//            positionThreeView.backgroundColor = .clear
        }
    }
    @IBOutlet var positionFourView: UIView! {
        didSet {
            positionFourView.layer.borderWidth = 1
            positionFourView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
//            positionFourView.backgroundColor = .clear
        }
    }
    @IBOutlet var cellBody: UIView! {
        didSet {
            cellBody.layer.borderWidth = 3
            cellBody.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        }
    }
    
    @IBOutlet var stackView: UIStackView! {
        didSet {
            stackView.layer.borderWidth = 0
        }
    }
    
    @IBOutlet var counselorOne: UILabel!
    @IBOutlet var counselorTwo: UILabel!
    @IBOutlet var counselorThree: UILabel!
    @IBOutlet var counselorFour: UILabel!
    
}
