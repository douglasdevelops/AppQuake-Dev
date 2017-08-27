//
//  Journals.swift
//  AppQuake
//
//  Created by Johan Sas on 26-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import Foundation

struct Journals {
    
    fileprivate let _journalId: String
    fileprivate let _date: String
    fileprivate let _journalDescription: String
    fileprivate let _owner: String
    fileprivate let _hourlyPay: String
    
    var journalId: String {
        return _journalId
    }
    
    var date: String {
        return _date
    }
    
    var journalDescription: String {
        return _journalId
    }
    
    var owner: String {
        return _owner
    }
    
    var hourlyPay: String {
        return _hourlyPay
    }
}
