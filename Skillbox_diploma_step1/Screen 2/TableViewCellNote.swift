//
//  TableViewCellNote.swift
//  Skillbox_diploma_step1
//
//  Created by Roman on 19.01.2021.
//

import UIKit

class TableViewCellNote: UITableViewCell {

    @IBOutlet var textFieldNotes: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
