//
//  Rounded View.swift
//  AppQuake
//
//  Created by Johan Sas on 11-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        
    }

}
