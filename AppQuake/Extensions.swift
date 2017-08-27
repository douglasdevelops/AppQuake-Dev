//
//  Extensions.swift
//  AppQuake
//
//  Created by Johan Sas on 26-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import Foundation

extension Date {
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
