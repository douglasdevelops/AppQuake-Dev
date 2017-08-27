//
//  JournalCell.swift
//  AppQuake
//
//  Created by Johan Sas on 25-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit

class JournalCell: UITableViewCell {

    // IBOutlets
   
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectDate: UILabel!
    @IBOutlet weak var projectDescription: UITextView!
    
    // Variables
    
    var journals: JournalPost!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization Code
    }
    
    func configureCell(journals: JournalPost) {
        self.journals = journals
        self.projectName.text = journals.name
        self.projectDate.text = journals.date
        self.projectDescription.text = journals.description
    }
}
