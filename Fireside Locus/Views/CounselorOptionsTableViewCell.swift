//
//  CounselorOptionsTableViewCell.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 5/14/22.
//

import UIKit

class CounselorOptionsTableViewCell: UITableViewCell {

    @IBOutlet var counselorName: UITextField!
    @IBOutlet var counselorOptions: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
