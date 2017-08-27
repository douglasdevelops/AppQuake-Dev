//
//  SignUpViewController.swift
//  AppQuake
//
//  Created by Johan Sas on 12-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController, UITextFieldDelegate {

    // MARK: IBOutlets
    
    @IBOutlet weak var appQuakeLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var secondPasswordTextField: UITextField!
    
    // MARK: Variables
    
    var isExist = false
    var userEmail: String!
    var firebaseUser: String!
    var userPassword: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.secondPasswordTextField.delegate = self
    }

    
    // MARK: Functions
    
    // Texfield Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // ErrorHandling
    
    func showAlertMessage(id: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func completeSignUp(id: String, userData: Dictionary<String, String>) {
        DataService.instance.createFireBaseDBUSer(uid: id, userData: userData)
        performSegue(withIdentifier: "showSignInVC", sender: nil)
    }
    
    func signUpUser() {
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
            if passwordTextField.text == secondPasswordTextField.text {
                Auth.auth().createUser(withEmail: email, password: pass, completion: {(user, error) in
                    if let firebaseError = error {
                        print(firebaseError.localizedDescription)
                        self.isExist = true
                        self.signUpButtonTapped(Any)
                        } else {
                        print(user!.email)
                        self.isExist = false
                        self.signUpButtonTapped(Any)
                    }
                })
            }
        }
    }
    
    // MARK: IBActions
    
    // signUp functions
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        if emailTextField.text == "", passwordTextField.text == "" {
            showAlertMessage(id: "Error", message: "All textfields have to contain a value")
        } else if passwordTextField.text == "" {
            showAlertMessage(id: "Error", message: "You have to enter a password")
        } else if emailTextField.text == ""{
            showAlertMessage(id: "Error", message: "You have to enter a email")
        } else if passwordTextField.text != secondPasswordTextField.text {
            showAlertMessage(id: "Error", message: "Both passwords should be identical")
        } else if self.isExist != false {
            showAlertMessage(id: "Error", message: "This emailaddress is already in use")
        } else {
            signUpUser()
            performSegue(withIdentifier: "showSignInVC", sender: nil)
        }
    }
}
