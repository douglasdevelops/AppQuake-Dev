//
//  JournalPopUpViewController.swift
//  AppQuake
//
//  Created by Johan Sas on 26-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit
import Firebase

class JournalPopUpViewController: UIViewController {

    // IBOutlets
    
    @IBOutlet weak var addProjectLabel: UILabel!
    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var hourlyPayTextField: UITextField!
    @IBOutlet weak var createProjectButton: PopUpButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    // Variables
    
    var DB_BASE = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // IBActions
    
    @IBAction func removePopUp(_ sender: Any) {
        self.removeAnimate()
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        postToFirebase()
    }
    
    // Functions
    
    func postToFirebase() {
        
        if projectNameTextField.text?.isEmpty == true || descriptionTextView.text.isEmpty == true {
            showAlertMessage("Error", message: "Both ProjectName and description should contain a value")
        } else {
            let journal: Dictionary<String, AnyObject> = ["name": projectNameTextField.text as AnyObject,
                                                          "description": descriptionTextView.text as AnyObject,
                                                          "date": Date().toString(dateFormat: "DD-MM-YYYY") as AnyObject,
                                                          "owner": userID as AnyObject,
                                                          "hourlyPay": hourlyPayTextField.text as AnyObject]
            
            let firebaseJournal = DataService.instance.REF_JOURNAL.childByAutoId()
            firebaseJournal.setValue(journal)
        
            projectNameTextField.text = ""
            descriptionTextView.text = ""
            
            removeAnimate()
        }
    }
    
    func showAlertMessage(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func showAnimate() {
        
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.0)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX:1.0, y: 1.0)
        });
    }

    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished: Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        });
    }
}
