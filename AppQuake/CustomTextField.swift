//
//  CustomTextField.swift
//  AppQuake
//
//  Created by Johan Sas on 07-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1).cgColor
        layer.borderWidth = 2
        
    }
    
}
