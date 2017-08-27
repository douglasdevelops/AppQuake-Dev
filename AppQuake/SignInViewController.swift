//
//  SignInViewController.swift
//  AppQuake
//
//  Created by Johan Sas on 07-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController, UITextFieldDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK :Variables
    
    var isExist = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
    }
    
    // MARK: Functions
    
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
    
    // CompleteSignIn Function
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.instance.createFireBaseDBUSer(uid: id, userData: userData)
        performSegue(withIdentifier: "showMainVC", sender: nil)
    }
    
    // Firebase Authentication Function
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print("Unable to authenticate with Firebase - \(String(describing: error))")
            } else {
                print("Successfully authenticated with Firebase")
                if let user = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: user.uid, userData: userData)            }
            }
            
        })
        
    }
    
    
    
 
    // IBActions
    
    @IBAction func signInButtonTapped(_ sender: CustomButton!) {
        if emailTextField.text == "", passwordTextField.text == "" {
            showAlertMessage(id: "Error", message: "Each textfield has to contain a value")
        } else if passwordTextField.text == "" {
            showAlertMessage(id: "Error", message: "You have to enter a password")
        } else if emailTextField.text == "" {
            showAlertMessage(id: "Error", message: "You have to enter a emailaddress")
        } else if passwordTextField.text != passwordTextField.text {
            showAlertMessage(id: "Error", message: "Password doesnt match")
        } else {
            //Unwraps textfields and check them to be constants
            if let email = emailTextField.text, let pwd = passwordTextField.text {
                Auth.auth().signIn(withEmail: email, password: pwd, completion: {(user, error) in if error == nil {
                    print("Email user has authentucated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                        print("Succesfully authenticated with Firebase")
                        if let user = user {
                            let userData = ["provider": user.providerID]
                            self.completeSignIn(id: user.uid, userData: userData)
                        }
                    }
                    })
                }
            }
        }
}
