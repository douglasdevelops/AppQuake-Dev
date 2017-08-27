//
//  DataService.swift
//  AppQuake
//
//  Created by Johan Sas on 09-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import Foundation
import Firebase


// Protocols

protocol DataServiceDelegate: class {
    func dataloaded()
}


// Variables

let DB_BASE = Database.database().reference()

class DataService {
    
    // Variables
    
    static let instance = DataService()
    let ref = Database.database().reference()
    weak var deletage: DataServiceDelegate?
    
    
    // Database variables
    
    private var _REF_BASE = DB_BASE
    private var _REF_USER = DB_BASE.child("users")
    
    // User Variables
    private var _REF_JOURNAL = DB_BASE.child("journals")
    private var _REF_TIMER = DB_BASE.child("timers")
    private var _REF_BILLINGS = DB_BASE.child("billings")
    private var _REF_CALENDAR = DB_BASE.child("agendas")
    private var _REF_PROFILE = DB_BASE.child("profiles")
    
    // DataService Setup
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USER: DatabaseReference {
        return _REF_USER
    }
    
    var REF_JOURNAL: DatabaseReference {
        return _REF_JOURNAL
    }
    
    var REF_TIMER: DatabaseReference {
        return _REF_TIMER
    }
    
    var REF_BILLINGS: DatabaseReference {
        return _REF_BILLINGS
    }
    
    var REF_CALENDAR: DatabaseReference {
        return _REF_CALENDAR
    }
    
    var REF_PROFILE: DatabaseReference {
        return _REF_PROFILE
    }
    
    // USer creation function
    
    func createFireBaseDBUSer(uid: String, userData: Dictionary<String, String>) {
        REF_USER.child(uid).updateChildValues(userData)
    }
    
    
}
