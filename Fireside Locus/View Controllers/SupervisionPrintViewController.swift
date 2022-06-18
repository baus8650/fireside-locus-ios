//
//  SupervisionPrintViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 6/16/22.
//

import UIKit
import PDFKit

@IBDesignable
class SupervisionPrintViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
    @IBOutlet var pdfSchedule: UIView!
    
    
    
    // MARK: - Assignment Column
    @IBOutlet var morningBasketballView: UIView! {
        didSet {
            morningBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var morningNorthPracticeVillageView: UIView! {
        didSet {
            morningNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var morningSouthPracticeVillageView: UIView! {
        didSet {
            morningSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var morningTentThreeView: UIView! {
        didSet {
            morningTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var afternoonBasketballView: UIView! {
        didSet {
            afternoonBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var afternoonNorthPracticeVillageView: UIView! {
        didSet {
            afternoonNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var afternoonSouthPracticeVillageView: UIView! {
        didSet {
            afternoonSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var afternoonTentThreeView: UIView! {
        didSet {
            afternoonTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var eveningNorthView: UIView! {
        didSet {
            eveningNorthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var eveningSouthView: UIView! {
        didSet {
            eveningSouthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var eveningActivityView: UIView! {
        didSet {
            eveningActivityView.layer.borderWidth = 1
        }
    }
    @IBOutlet var nightwatchOneView: UIView! {
        didSet {
            nightwatchOneView.layer.borderWidth = 1
        }
    }
    @IBOutlet var nightwatchTwoView: UIView! {
        didSet {
            nightwatchTwoView.layer.borderWidth = 1
        }
    }
    @IBOutlet var dayOffView: UIView! {
        didSet {
            dayOffView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var morningBasketballLabel: UILabel! {
        didSet {
            morningBasketballLabel.text = "8:30–12 Basketball Court"
        }
    }
    @IBOutlet var morningNorthPracticeVillageLabel: UILabel! {
        didSet {
            morningNorthPracticeVillageLabel.text = "8:30–12 North Practice Village"
        }
    }
    @IBOutlet var morningSouthPracticeVillageLabel: UILabel! {
        didSet {
            morningSouthPracticeVillageLabel.text = "8:30–12 South Practice Village"
        }
    }
    @IBOutlet var morningTentThreeLabel: UILabel! {
        didSet {
            morningTentThreeLabel.text = "8:30–12 Tent 3"
        }
    }
    @IBOutlet var afternoonBasketballLabel: UILabel! {
        didSet {
            afternoonBasketballLabel.text = "12:30–4 Basketball Court"
        }
    }
    @IBOutlet var afternoonNorthPracticeVillageLabel: UILabel! {
        didSet {
            afternoonNorthPracticeVillageLabel.text = "12:30–4 North Practice Village"
        }
    }
    @IBOutlet var afternoonSouthPracticeVillageLabel: UILabel! {
        didSet {
            afternoonSouthPracticeVillageLabel.text = "12:30–4 South Practice Village"
        }
    }
    @IBOutlet var afternoonTentThreeLabel: UILabel! {
        didSet {
            afternoonTentThreeLabel.text = "12:30–4 Tent 3"
        }
    }
    @IBOutlet var eveningNorthLabel: UILabel! {
        didSet {
            eveningNorthLabel.text = "6:30–CI North Village"
        }
    }
    @IBOutlet var eveningSouthLabel: UILabel! {
        didSet {
            eveningSouthLabel.text = "6:30–CI South Village"
        }
    }
    @IBOutlet var eveningActivityLabel: UILabel! {
        didSet {
            eveningActivityLabel.text = "Evening Activity"
        }
    }
    @IBOutlet var nightwatchOneLabel: UILabel! {
        didSet {
            nightwatchOneLabel.text = "10PM – 3AM Nightwatch"
        }
    }
    @IBOutlet var nightwatchTwoLabel: UILabel! {
        didSet {
            nightwatchTwoLabel.text = "3AM – 8AM Nightwatch"
        }
    }
    @IBOutlet var dayOffLabel: UILabel! {
        didSet {
            dayOffLabel.text = "Day Off"
        }
    }
    
    // MARK: - Sunday Column
    @IBOutlet var sundayDayView: UIView! {
        didSet {
            sundayDayView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var sundayMorningBasketballView: UIView! {
        didSet {
            sundayMorningBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayMorningNorthPracticeVillageView: UIView! {
        didSet {
            sundayMorningNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayMorningSouthPracticeVillageView: UIView! {
        didSet {
            sundayMorningSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayMorningTentThreeView: UIView! {
        didSet {
            sundayMorningTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayAfternoonBasketballView: UIView! {
        didSet {
            sundayAfternoonBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayAfternoonNorthPracticeVillageView: UIView! {
        didSet {
            sundayAfternoonNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayAfternoonSouthPracticeVillageView: UIView! {
        didSet {
            sundayAfternoonSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayAfternoonTentThreeView: UIView! {
        didSet {
            sundayAfternoonTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayEveningNorthView: UIView! {
        didSet {
            sundayEveningNorthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayEveningSouthView: UIView! {
        didSet {
            sundayEveningSouthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayEveningActivityView: UIView! {
        didSet {
            sundayEveningActivityView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayNightwatchOneView: UIView! {
        didSet {
            sundayNightwatchOneView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayNightwatchTwoView: UIView! {
        didSet {
            sundayNightwatchTwoView.layer.borderWidth = 1
        }
    }
    @IBOutlet var sundayDayOffView: UIView! {
        didSet {
            sundayDayOffView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var sundayDayContent: UILabel! {
        didSet {
            sundayDayContent.text = "Sunday"
        }
    }
    
    @IBOutlet var sundayMorningBasketballContent: UITextField! {
        didSet {
            sundayMorningBasketballContent.text = ""
        }
    }
    @IBOutlet var sundayMorningNorthPracticeVillageContent: UITextField! {
        didSet {
            sundayMorningNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var sundayMorningSouthPracticeVillageContent: UITextField! {
        didSet {
            sundayMorningSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var sundayMorningTentThreeContent: UITextField! {
        didSet {
            sundayMorningTentThreeContent.text = ""
        }
    }
    @IBOutlet var sundayAfternoonBasketballContent: UITextField! {
        didSet {
            sundayAfternoonBasketballContent.text = ""
        }
    }
    @IBOutlet var sundayAfternoonNorthPracticeVillageContent: UITextField! {
        didSet {
            sundayAfternoonNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var sundayAfternoonSouthPracticeVillageContent: UITextField! {
        didSet {
            sundayAfternoonSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var sundayAfternoonTentThreeContent: UITextField! {
        didSet {
            sundayAfternoonTentThreeContent.text = ""
        }
    }
    @IBOutlet var sundayEveningNorthContent: UITextField! {
        didSet {
            sundayEveningNorthContent.text = ""
        }
    }
    @IBOutlet var sundayEveningSouthContent: UITextField! {
        didSet {
            sundayEveningSouthContent.text = ""
        }
    }
    @IBOutlet var sundayEveningActivityContent: UITextView! {
        didSet {
            sundayEveningActivityContent.text = ""
        }
    }
    @IBOutlet var sundayNightwatchOneContent: UITextField! {
        didSet {
            sundayNightwatchOneContent.text = ""
        }
    }
    @IBOutlet var sundayNightwatchTwoContent: UITextField! {
        didSet {
            sundayNightwatchTwoContent.text = ""
        }
    }
    @IBOutlet var sundayDayOffContentOne: UITextField! {
        didSet {
            sundayDayOffContentOne.text = ""
        }
    }
    @IBOutlet var sundayDayOffContentTwo: UITextField! {
        didSet {
            sundayDayOffContentTwo.text = ""
        }
    }
    
    // MARK: - Monday Column
    
    @IBOutlet var mondayDayView: UIView! {
        didSet {
            mondayDayView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var mondayMorningBasketballView: UIView! {
        didSet {
            mondayMorningBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayMorningNorthPracticeVillageView: UIView! {
        didSet {
            mondayMorningNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayMorningSouthPracticeVillageView: UIView! {
        didSet {
            mondayMorningSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayMorningTentThreeView: UIView! {
        didSet {
            mondayMorningTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayAfternoonBasketballView: UIView! {
        didSet {
            mondayAfternoonBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayAfternoonNorthPracticeVillageView: UIView! {
        didSet {
            mondayAfternoonNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayAfternoonSouthPracticeVillageView: UIView! {
        didSet {
            mondayAfternoonSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayAfternoonTentThreeView: UIView! {
        didSet {
            mondayAfternoonTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayEveningNorthView: UIView! {
        didSet {
            mondayEveningNorthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayEveningSouthView: UIView! {
        didSet {
            mondayEveningSouthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayEveningActivityView: UIView! {
        didSet {
            mondayEveningActivityView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayNightwatchOneView: UIView! {
        didSet {
            mondayNightwatchOneView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayNightwatchTwoView: UIView! {
        didSet {
            mondayNightwatchTwoView.layer.borderWidth = 1
        }
    }
    @IBOutlet var mondayDayOffView: UIView! {
        didSet {
            mondayDayOffView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var mondayDayContent: UILabel! {
        didSet {
            mondayDayContent.text = "Monday"
        }
    }
    
    @IBOutlet var mondayMorningBasketballContent: UITextField! {
        didSet {
            mondayMorningBasketballContent.text = ""
        }
    }
    @IBOutlet var mondayMorningNorthPracticeVillageContent: UITextField! {
        didSet {
            mondayMorningNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var mondayMorningSouthPracticeVillageContent: UITextField! {
        didSet {
            mondayMorningSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var mondayMorningTentThreeContent: UITextField! {
        didSet {
            mondayMorningTentThreeContent.text = ""
        }
    }
    @IBOutlet var mondayAfternoonBasketballContent: UITextField! {
        didSet {
            mondayAfternoonBasketballContent.text = ""
        }
    }
    @IBOutlet var mondayAfternoonNorthPracticeVillageContent: UITextField! {
        didSet {
            mondayAfternoonNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var mondayAfternoonSouthPracticeVillageContent: UITextField! {
        didSet {
            mondayAfternoonSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var mondayAfternoonTentThreeContent: UITextField! {
        didSet {
            mondayAfternoonTentThreeContent.text = ""
        }
    }
    @IBOutlet var mondayEveningNorthContent: UITextField! {
        didSet {
            mondayEveningNorthContent.text = ""
        }
    }
    @IBOutlet var mondayEveningSouthContent: UITextField! {
        didSet {
            mondayEveningSouthContent.text = ""
        }
    }
    @IBOutlet var mondayEveningActivityContent: UITextView! {
        didSet {
            mondayEveningActivityContent.text = ""
        }
    }
    @IBOutlet var mondayNightwatchOneContent: UITextField! {
        didSet {
            mondayNightwatchOneContent.text = ""
        }
    }
    @IBOutlet var mondayNightwatchTwoContent: UITextField! {
        didSet {
            mondayNightwatchTwoContent.text = ""
        }
    }
    @IBOutlet var mondayDayOffContentOne: UITextField! {
        didSet {
            mondayDayOffContentOne.text = ""
        }
    }
    @IBOutlet var mondayDayOffContentTwo: UITextField! {
        didSet {
            mondayDayOffContentTwo.text = ""
        }
    }
    
    // MARK: - Tuesday Column
    
    @IBOutlet var tuesdayDayView: UIView! {
        didSet {
            tuesdayDayView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var tuesdayMorningBasketballView: UIView! {
        didSet {
            tuesdayMorningBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayMorningNorthPracticeVillageView: UIView! {
        didSet {
            tuesdayMorningNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayMorningSouthPracticeVillageView: UIView! {
        didSet {
            tuesdayMorningSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayMorningTentThreeView: UIView! {
        didSet {
            tuesdayMorningTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayAfternoonBasketballView: UIView! {
        didSet {
            tuesdayAfternoonBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayAfternoonNorthPracticeVillageView: UIView! {
        didSet {
            tuesdayAfternoonNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayAfternoonSouthPracticeVillageView: UIView! {
        didSet {
            tuesdayAfternoonSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayAfternoonTentThreeView: UIView! {
        didSet {
            tuesdayAfternoonTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayEveningNorthView: UIView! {
        didSet {
            tuesdayEveningNorthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayEveningSouthView: UIView! {
        didSet {
            tuesdayEveningSouthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayEveningActivityView: UIView! {
        didSet {
            tuesdayEveningActivityView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayNightwatchOneView: UIView! {
        didSet {
            tuesdayNightwatchOneView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayNightwatchTwoView: UIView! {
        didSet {
            tuesdayNightwatchTwoView.layer.borderWidth = 1
        }
    }
    @IBOutlet var tuesdayDayOffView: UIView! {
        didSet {
            tuesdayDayOffView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var tuesdayDayContent: UILabel! {
        didSet {
            tuesdayDayContent.text = "Tuesday"
        }
    }
    
    @IBOutlet var tuesdayMorningBasketballContent: UITextField! {
        didSet {
            tuesdayMorningBasketballContent.text = ""
        }
    }
    @IBOutlet var tuesdayMorningNorthPracticeVillageContent: UITextField! {
        didSet {
            tuesdayMorningNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var tuesdayMorningSouthPracticeVillageContent: UITextField! {
        didSet {
            tuesdayMorningSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var tuesdayMorningTentThreeContent: UITextField! {
        didSet {
            tuesdayMorningTentThreeContent.text = ""
        }
    }
    @IBOutlet var tuesdayAfternoonBasketballContent: UITextField! {
        didSet {
            tuesdayAfternoonBasketballContent.text = ""
        }
    }
    @IBOutlet var tuesdayAfternoonNorthPracticeVillageContent: UITextField! {
        didSet {
            tuesdayAfternoonNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var tuesdayAfternoonSouthPracticeVillageContent: UITextField! {
        didSet {
            tuesdayAfternoonSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var tuesdayAfternoonTentThreeContent: UITextField! {
        didSet {
            tuesdayAfternoonTentThreeContent.text = ""
        }
    }
    @IBOutlet var tuesdayEveningNorthContent: UITextField! {
        didSet {
            tuesdayEveningNorthContent.text = ""
        }
    }
    @IBOutlet var tuesdayEveningSouthContent: UITextField! {
        didSet {
            tuesdayEveningSouthContent.text = ""
        }
    }
    @IBOutlet var tuesdayEveningActivityContent: UITextView! {
        didSet {
            tuesdayEveningActivityContent.text = ""
        }
    }
    @IBOutlet var tuesdayNightwatchOneContent: UITextField! {
        didSet {
            tuesdayNightwatchOneContent.text = ""
        }
    }
    @IBOutlet var tuesdayNightwatchTwoContent: UITextField! {
        didSet {
            tuesdayNightwatchTwoContent.text = ""
        }
    }
    @IBOutlet var tuesdayDayOffContentOne: UITextField! {
        didSet {
            tuesdayDayOffContentOne.text = ""
        }
    }
    @IBOutlet var tuesdayDayOffContentTwo: UITextField! {
        didSet {
            tuesdayDayOffContentTwo.text = ""
        }
    }
    
    
    // MARK: - Wednesday Column
    
    @IBOutlet var wednesdayDayView: UIView! {
        didSet {
            wednesdayDayView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var wednesdayMorningBasketballView: UIView! {
        didSet {
            wednesdayMorningBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayMorningNorthPracticeVillageView: UIView! {
        didSet {
            wednesdayMorningNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayMorningSouthPracticeVillageView: UIView! {
        didSet {
            wednesdayMorningSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayMorningTentThreeView: UIView! {
        didSet {
            wednesdayMorningTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayAfternoonBasketballView: UIView! {
        didSet {
            wednesdayAfternoonBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayAfternoonNorthPracticeVillageView: UIView! {
        didSet {
            wednesdayAfternoonNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayAfternoonSouthPracticeVillageView: UIView! {
        didSet {
            wednesdayAfternoonSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayAfternoonTentThreeView: UIView! {
        didSet {
            wednesdayAfternoonTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayEveningNorthView: UIView! {
        didSet {
            wednesdayEveningNorthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayEveningSouthView: UIView! {
        didSet {
            wednesdayEveningSouthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayEveningActivityView: UIView! {
        didSet {
            wednesdayEveningActivityView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayNightwatchOneView: UIView! {
        didSet {
            wednesdayNightwatchOneView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayNightwatchTwoView: UIView! {
        didSet {
            wednesdayNightwatchTwoView.layer.borderWidth = 1
        }
    }
    @IBOutlet var wednesdayDayOffView: UIView! {
        didSet {
            wednesdayDayOffView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var wednesdayDayContent: UILabel! {
        didSet {
            wednesdayDayContent.text = "Wednesday"
        }
    }
    
    @IBOutlet var wednesdayMorningBasketballContent: UITextField! {
        didSet {
            wednesdayMorningBasketballContent.text = ""
        }
    }
    @IBOutlet var wednesdayMorningNorthPracticeVillageContent: UITextField! {
        didSet {
            wednesdayMorningNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var wednesdayMorningSouthPracticeVillageContent: UITextField! {
        didSet {
            wednesdayMorningSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var wednesdayMorningTentThreeContent: UITextField! {
        didSet {
            wednesdayMorningTentThreeContent.text = ""
        }
    }
    @IBOutlet var wednesdayAfternoonBasketballContent: UITextField! {
        didSet {
            wednesdayAfternoonBasketballContent.text = ""
        }
    }
    @IBOutlet var wednesdayAfternoonNorthPracticeVillageContent: UITextField! {
        didSet {
            wednesdayAfternoonNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var wednesdayAfternoonSouthPracticeVillageContent: UITextField! {
        didSet {
            wednesdayAfternoonSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var wednesdayAfternoonTentThreeContent: UITextField! {
        didSet {
            wednesdayAfternoonTentThreeContent.text = ""
        }
    }
    @IBOutlet var wednesdayEveningNorthContent: UITextField! {
        didSet {
            wednesdayEveningNorthContent.text = ""
        }
    }
    @IBOutlet var wednesdayEveningSouthContent: UITextField! {
        didSet {
            wednesdayEveningSouthContent.text = ""
        }
    }
    @IBOutlet var wednesdayEveningActivityContent: UITextView! {
        didSet {
            wednesdayEveningActivityContent.text = ""
        }
    }
    @IBOutlet var wednesdayNightwatchOneContent: UITextField! {
        didSet {
            wednesdayNightwatchOneContent.text = ""
        }
    }
    @IBOutlet var wednesdayNightwatchTwoContent: UITextField! {
        didSet {
            wednesdayNightwatchTwoContent.text = ""
        }
    }
    @IBOutlet var wednesdayDayOffContentOne: UITextField! {
        didSet {
            wednesdayDayOffContentOne.text = ""
        }
    }
    @IBOutlet var wednesdayDayOffContentTwo: UITextField! {
        didSet {
            wednesdayDayOffContentTwo.text = ""
        }
    }
    
    
    // MARK: - Thursday Column
    
    @IBOutlet var thursdayDayView: UIView! {
        didSet {
            thursdayDayView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var thursdayMorningBasketballView: UIView! {
        didSet {
            thursdayMorningBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayMorningNorthPracticeVillageView: UIView! {
        didSet {
            thursdayMorningNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayMorningSouthPracticeVillageView: UIView! {
        didSet {
            thursdayMorningSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayMorningTentThreeView: UIView! {
        didSet {
            thursdayMorningTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayAfternoonBasketballView: UIView! {
        didSet {
            thursdayAfternoonBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayAfternoonNorthPracticeVillageView: UIView! {
        didSet {
            thursdayAfternoonNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayAfternoonSouthPracticeVillageView: UIView! {
        didSet {
            thursdayAfternoonSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayAfternoonTentThreeView: UIView! {
        didSet {
            thursdayAfternoonTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayEveningNorthView: UIView! {
        didSet {
            thursdayEveningNorthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayEveningSouthView: UIView! {
        didSet {
            thursdayEveningSouthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayEveningActivityView: UIView! {
        didSet {
            thursdayEveningActivityView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayNightwatchOneView: UIView! {
        didSet {
            thursdayNightwatchOneView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayNightwatchTwoView: UIView! {
        didSet {
            thursdayNightwatchTwoView.layer.borderWidth = 1
        }
    }
    @IBOutlet var thursdayDayOffView: UIView! {
        didSet {
            thursdayDayOffView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var thursdayDayContent: UILabel! {
        didSet {
            thursdayDayContent.text = "Thursday"
        }
    }
    
    @IBOutlet var thursdayMorningBasketballContent: UITextField! {
        didSet {
            thursdayMorningBasketballContent.text = ""
        }
    }
    @IBOutlet var thursdayMorningNorthPracticeVillageContent: UITextField! {
        didSet {
            thursdayMorningNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var thursdayMorningSouthPracticeVillageContent: UITextField! {
        didSet {
            thursdayMorningSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var thursdayMorningTentThreeContent: UITextField! {
        didSet {
            thursdayMorningTentThreeContent.text = ""
        }
    }
    @IBOutlet var thursdayAfternoonBasketballContent: UITextField! {
        didSet {
            thursdayAfternoonBasketballContent.text = ""
        }
    }
    @IBOutlet var thursdayAfternoonNorthPracticeVillageContent: UITextField! {
        didSet {
            thursdayAfternoonNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var thursdayAfternoonSouthPracticeVillageContent: UITextField! {
        didSet {
            thursdayAfternoonSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var thursdayAfternoonTentThreeContent: UITextField! {
        didSet {
            thursdayAfternoonTentThreeContent.text = ""
        }
    }
    @IBOutlet var thursdayEveningNorthContent: UITextField! {
        didSet {
            thursdayEveningNorthContent.text = ""
        }
    }
    @IBOutlet var thursdayEveningSouthContent: UITextField! {
        didSet {
            thursdayEveningSouthContent.text = ""
        }
    }
    @IBOutlet var thursdayEveningActivityContent: UITextView! {
        didSet {
            thursdayEveningActivityContent.text = ""
        }
    }
    @IBOutlet var thursdayNightwatchOneContent: UITextField! {
        didSet {
            thursdayNightwatchOneContent.text = ""
        }
    }
    @IBOutlet var thursdayNightwatchTwoContent: UITextField! {
        didSet {
            thursdayNightwatchTwoContent.text = ""
        }
    }
    @IBOutlet var thursdayDayOffContentOne: UITextField! {
        didSet {
            thursdayDayOffContentOne.text = ""
        }
    }
    @IBOutlet var thursdayDayOffContentTwo: UITextField! {
        didSet {
            thursdayDayOffContentTwo.text = ""
        }
    }
    
    
    // MARK: - Friday Column
    
    @IBOutlet var fridayDayView: UIView! {
        didSet {
            fridayDayView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var fridayMorningBasketballView: UIView! {
        didSet {
            fridayMorningBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayMorningNorthPracticeVillageView: UIView! {
        didSet {
            fridayMorningNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayMorningSouthPracticeVillageView: UIView! {
        didSet {
            fridayMorningSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayMorningTentThreeView: UIView! {
        didSet {
            fridayMorningTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayAfternoonBasketballView: UIView! {
        didSet {
            fridayAfternoonBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayAfternoonNorthPracticeVillageView: UIView! {
        didSet {
            fridayAfternoonNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayAfternoonSouthPracticeVillageView: UIView! {
        didSet {
            fridayAfternoonSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayAfternoonTentThreeView: UIView! {
        didSet {
            fridayAfternoonTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayEveningNorthView: UIView! {
        didSet {
            fridayEveningNorthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayEveningSouthView: UIView! {
        didSet {
            fridayEveningSouthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayEveningActivityView: UIView! {
        didSet {
            fridayEveningActivityView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayNightwatchOneView: UIView! {
        didSet {
            fridayNightwatchOneView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayNightwatchTwoView: UIView! {
        didSet {
            fridayNightwatchTwoView.layer.borderWidth = 1
        }
    }
    @IBOutlet var fridayDayOffView: UIView! {
        didSet {
            fridayDayOffView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var fridayDayContent: UILabel! {
        didSet {
            fridayDayContent.text = "Friday"
        }
    }
    
    @IBOutlet var fridayMorningBasketballContent: UITextField! {
        didSet {
            fridayMorningBasketballContent.text = ""
        }
    }
    @IBOutlet var fridayMorningNorthPracticeVillageContent: UITextField! {
        didSet {
            fridayMorningNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var fridayMorningSouthPracticeVillageContent: UITextField! {
        didSet {
            fridayMorningSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var fridayMorningTentThreeContent: UITextField! {
        didSet {
            fridayMorningTentThreeContent.text = ""
        }
    }
    @IBOutlet var fridayAfternoonBasketballContent: UITextField! {
        didSet {
            fridayAfternoonBasketballContent.text = ""
        }
    }
    @IBOutlet var fridayAfternoonNorthPracticeVillageContent: UITextField! {
        didSet {
            fridayAfternoonNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var fridayAfternoonSouthPracticeVillageContent: UITextField! {
        didSet {
            fridayAfternoonSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var fridayAfternoonTentThreeContent: UITextField! {
        didSet {
            fridayAfternoonTentThreeContent.text = ""
        }
    }
    @IBOutlet var fridayEveningNorthContent: UITextField! {
        didSet {
            fridayEveningNorthContent.text = ""
        }
    }
    @IBOutlet var fridayEveningSouthContent: UITextField! {
        didSet {
            fridayEveningSouthContent.text = ""
        }
    }
    @IBOutlet var fridayEveningActivityContent: UITextView! {
        didSet {
            fridayEveningActivityContent.text = ""
        }
    }
    @IBOutlet var fridayNightwatchOneContent: UITextField! {
        didSet {
            fridayNightwatchOneContent.text = ""
        }
    }
    @IBOutlet var fridayNightwatchTwoContent: UITextField! {
        didSet {
            fridayNightwatchTwoContent.text = ""
        }
    }
    @IBOutlet var fridayDayOffContentOne: UITextField! {
        didSet {
            fridayDayOffContentOne.text = ""
        }
    }
    @IBOutlet var fridayDayOffContentTwo: UITextField! {
        didSet {
            fridayDayOffContentTwo.text = ""
        }
    }
    
    
    // MARK: - Saturday Column
    
    @IBOutlet var saturdayDayView: UIView! {
        didSet {
            saturdayDayView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var saturdayMorningBasketballView: UIView! {
        didSet {
            saturdayMorningBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayMorningNorthPracticeVillageView: UIView! {
        didSet {
            saturdayMorningNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayMorningSouthPracticeVillageView: UIView! {
        didSet {
            saturdayMorningSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayMorningTentThreeView: UIView! {
        didSet {
            saturdayMorningTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayAfternoonBasketballView: UIView! {
        didSet {
            saturdayAfternoonBasketballView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayAfternoonNorthPracticeVillageView: UIView! {
        didSet {
            saturdayAfternoonNorthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayAfternoonSouthPracticeVillageView: UIView! {
        didSet {
            saturdayAfternoonSouthPracticeVillageView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayAfternoonTentThreeView: UIView! {
        didSet {
            saturdayAfternoonTentThreeView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayEveningNorthView: UIView! {
        didSet {
            saturdayEveningNorthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayEveningSouthView: UIView! {
        didSet {
            saturdayEveningSouthView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayEveningActivityView: UIView! {
        didSet {
            saturdayEveningActivityView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayNightwatchOneView: UIView! {
        didSet {
            saturdayNightwatchOneView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayNightwatchTwoView: UIView! {
        didSet {
            saturdayNightwatchTwoView.layer.borderWidth = 1
        }
    }
    @IBOutlet var saturdayDayOffView: UIView! {
        didSet {
            saturdayDayOffView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet var saturdayDayContent: UILabel! {
        didSet {
            saturdayDayContent.text = "Saturday"
        }
    }
    
    @IBOutlet var saturdayMorningBasketballContent: UITextField! {
        didSet {
            saturdayMorningBasketballContent.text = ""
        }
    }
    @IBOutlet var saturdayMorningNorthPracticeVillageContent: UITextField! {
        didSet {
            saturdayMorningNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var saturdayMorningSouthPracticeVillageContent: UITextField! {
        didSet {
            saturdayMorningSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var saturdayMorningTentThreeContent: UITextField! {
        didSet {
            saturdayMorningTentThreeContent.text = ""
        }
    }
    @IBOutlet var saturdayAfternoonBasketballContent: UITextField! {
        didSet {
            saturdayAfternoonBasketballContent.text = ""
        }
    }
    @IBOutlet var saturdayAfternoonNorthPracticeVillageContent: UITextField! {
        didSet {
            saturdayAfternoonNorthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var saturdayAfternoonSouthPracticeVillageContent: UITextField! {
        didSet {
            saturdayAfternoonSouthPracticeVillageContent.text = ""
        }
    }
    @IBOutlet var saturdayAfternoonTentThreeContent: UITextField! {
        didSet {
            saturdayAfternoonTentThreeContent.text = ""
        }
    }
    @IBOutlet var saturdayEveningNorthContent: UITextField! {
        didSet {
            saturdayEveningNorthContent.text = ""
        }
    }
    @IBOutlet var saturdayEveningSouthContent: UITextField! {
        didSet {
            saturdayEveningSouthContent.text = ""
        }
    }
    @IBOutlet var saturdayEveningActivityContent: UITextView! {
        didSet {
            saturdayEveningActivityContent.text = ""
        }
    }
    @IBOutlet var saturdayNightwatchOneContent: UITextField! {
        didSet {
            saturdayNightwatchOneContent.text = ""
        }
    }
    @IBOutlet var saturdayNightwatchTwoContent: UITextField! {
        didSet {
            saturdayNightwatchTwoContent.text = ""
        }
    }
    @IBOutlet var saturdayDayOffContentOne: UITextField! {
        didSet {
            saturdayDayOffContentOne.text = ""
        }
    }
    @IBOutlet var saturdayDayOffContentTwo: UITextField! {
        didSet {
            saturdayDayOffContentTwo.text = ""
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Generate PDF", style: .plain, target: nil, action: #selector(makePDF))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share PDF", style: .plain, target: self, action: #selector(sharePDF))
        // Do any additional setup after loading the view.
        
        sundayMorningBasketballContent.delegate = self
        sundayMorningNorthPracticeVillageContent.delegate = self
        sundayMorningSouthPracticeVillageContent.delegate = self
        sundayMorningTentThreeContent.delegate = self
        sundayAfternoonBasketballContent.delegate = self
        sundayAfternoonNorthPracticeVillageContent.delegate = self
        sundayAfternoonSouthPracticeVillageContent.delegate = self
        sundayAfternoonTentThreeContent.delegate = self
        sundayEveningNorthContent.delegate = self
        sundayEveningSouthContent.delegate = self
        sundayEveningActivityContent.delegate = self
        sundayNightwatchOneContent.delegate = self
        sundayNightwatchTwoContent.delegate = self
        sundayDayOffContentOne.delegate = self
        sundayDayOffContentTwo.delegate = self
        mondayMorningBasketballContent.delegate = self
        mondayMorningNorthPracticeVillageContent.delegate = self
        mondayMorningSouthPracticeVillageContent.delegate = self
        mondayMorningTentThreeContent.delegate = self
        mondayAfternoonBasketballContent.delegate = self
        mondayAfternoonNorthPracticeVillageContent.delegate = self
        mondayAfternoonSouthPracticeVillageContent.delegate = self
        mondayAfternoonTentThreeContent.delegate = self
        mondayEveningNorthContent.delegate = self
        mondayEveningSouthContent.delegate = self
        mondayEveningActivityContent.delegate = self
        mondayNightwatchOneContent.delegate = self
        mondayNightwatchTwoContent.delegate = self
        mondayDayOffContentOne.delegate = self
        mondayDayOffContentTwo.delegate = self
        tuesdayMorningBasketballContent.delegate = self
        tuesdayMorningNorthPracticeVillageContent.delegate = self
        tuesdayMorningSouthPracticeVillageContent.delegate = self
        tuesdayMorningTentThreeContent.delegate = self
        tuesdayAfternoonBasketballContent.delegate = self
        tuesdayAfternoonNorthPracticeVillageContent.delegate = self
        tuesdayAfternoonSouthPracticeVillageContent.delegate = self
        tuesdayAfternoonTentThreeContent.delegate = self
        tuesdayEveningNorthContent.delegate = self
        tuesdayEveningSouthContent.delegate = self
        tuesdayEveningActivityContent.delegate = self
        tuesdayNightwatchOneContent.delegate = self
        tuesdayNightwatchTwoContent.delegate = self
        tuesdayDayOffContentOne.delegate = self
        tuesdayDayOffContentTwo.delegate = self
        wednesdayMorningBasketballContent.delegate = self
        wednesdayMorningNorthPracticeVillageContent.delegate = self
        wednesdayMorningSouthPracticeVillageContent.delegate = self
        wednesdayMorningTentThreeContent.delegate = self
        wednesdayAfternoonBasketballContent.delegate = self
        wednesdayAfternoonNorthPracticeVillageContent.delegate = self
        wednesdayAfternoonSouthPracticeVillageContent.delegate = self
        wednesdayAfternoonTentThreeContent.delegate = self
        wednesdayEveningNorthContent.delegate = self
        wednesdayEveningSouthContent.delegate = self
        wednesdayEveningActivityContent.delegate = self
        wednesdayNightwatchOneContent.delegate = self
        wednesdayNightwatchTwoContent.delegate = self
        wednesdayDayOffContentOne.delegate = self
        wednesdayDayOffContentTwo.delegate = self
        thursdayMorningBasketballContent.delegate = self
        thursdayMorningNorthPracticeVillageContent.delegate = self
        thursdayMorningSouthPracticeVillageContent.delegate = self
        thursdayMorningTentThreeContent.delegate = self
        thursdayAfternoonBasketballContent.delegate = self
        thursdayAfternoonNorthPracticeVillageContent.delegate = self
        thursdayAfternoonSouthPracticeVillageContent.delegate = self
        thursdayAfternoonTentThreeContent.delegate = self
        thursdayEveningNorthContent.delegate = self
        thursdayEveningSouthContent.delegate = self
        thursdayEveningActivityContent.delegate = self
        thursdayNightwatchOneContent.delegate = self
        thursdayNightwatchTwoContent.delegate = self
        thursdayDayOffContentOne.delegate = self
        thursdayDayOffContentTwo.delegate = self
        fridayMorningBasketballContent.delegate = self
        fridayMorningNorthPracticeVillageContent.delegate = self
        fridayMorningSouthPracticeVillageContent.delegate = self
        fridayMorningTentThreeContent.delegate = self
        fridayAfternoonBasketballContent.delegate = self
        fridayAfternoonNorthPracticeVillageContent.delegate = self
        fridayAfternoonSouthPracticeVillageContent.delegate = self
        fridayAfternoonTentThreeContent.delegate = self
        fridayEveningNorthContent.delegate = self
        fridayEveningSouthContent.delegate = self
        fridayEveningActivityContent.delegate = self
        fridayNightwatchOneContent.delegate = self
        fridayNightwatchTwoContent.delegate = self
        fridayDayOffContentOne.delegate = self
        fridayDayOffContentTwo.delegate = self
        saturdayMorningBasketballContent.delegate = self
        saturdayMorningNorthPracticeVillageContent.delegate = self
        saturdayMorningSouthPracticeVillageContent.delegate = self
        saturdayMorningTentThreeContent.delegate = self
        saturdayAfternoonBasketballContent.delegate = self
        saturdayAfternoonNorthPracticeVillageContent.delegate = self
        saturdayAfternoonSouthPracticeVillageContent.delegate = self
        saturdayAfternoonTentThreeContent.delegate = self
        saturdayEveningNorthContent.delegate = self
        saturdayEveningSouthContent.delegate = self
        saturdayEveningActivityContent.delegate = self
        saturdayNightwatchOneContent.delegate = self
        saturdayNightwatchTwoContent.delegate = self
        saturdayDayOffContentOne.delegate = self
        saturdayDayOffContentTwo.delegate = self
    }
    
    @objc func sharePDF() {
        print("PRESSING THE DAMN BUTTON")
        let image = pdfSchedule.asImage()

        let pdfCreator = PDFCreator(image: image)
        let pdfData = pdfCreator.makePDF()
        let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
        if UIDevice.current.userInterfaceIdiom == .pad {
            vc.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
            vc.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: 300, height: 350)
            vc.popoverPresentationController?.permittedArrowDirections = [.left]
        }
        present(vc, animated: true, completion: nil)
    }
    
//    func textFieldShouldReturn(textField: UITextField!) -> Bool {
//        print("IS THIS RECOGNIZED")
//        self.view.endEditing(true)
//        return true;
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
