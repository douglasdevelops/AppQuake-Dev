//
//  JournalPost.swift
//  AppQuake
//
//  Created by Johan Sas on 26-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import Foundation

class JournalPost {
    
    private var _name: String!
    private var _date: String!
    private var _description: String!
    private var _postKey: String!
    private var _owner: String! = userID!
    private var _hourlyPay: String!
    
    var name: String {
        return _name
    }
    
    var date: String {
        return _date
    }
    
    var description: String {
        return _description
    }
    
    var postKey: String {
        return _postKey
    }
    
    var owner: String {
        return _owner
    }
    
    var hourlyPay: String {
        return _hourlyPay
    }
    
    init(name: String, date: String, description: String) {
        self._name = name
        self._date = date
        self._description = description
        self._owner = owner
        self._hourlyPay = hourlyPay
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let name = postData["name"] as? String {
            self._name = name
        }
        
        if let date = postData["date"] as? String {
            self._date = date
        }
        
        if let description = postData["description"] as? String {
            self._description = description
        }
        
        if let owner = postData["owner"] as? String {
            self._owner = owner
        }
        
        if let hourlyPay = postData["hourlyPay"] as? String {
            self._hourlyPay = hourlyPay
        }
    }
}
