//
//  ViewController.swift
//  AppQuake
//
//  Created by Johan Sas on 07-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    // MARK: Variables
    
    var mainViewController: UIViewController!
    var journalViewController: UIViewController!
    var timeViewController: UIViewController!
    var billingViewController: UIViewController!
    var agendaViewController: UIViewController!
    var profileViewController: UIViewController!
    var selectedindex: Int = 0
    var viewControllers: [UIViewController]!
    
    
    // MARK: IBOutlets
    
    @IBOutlet weak var manView: UIView!
    @IBOutlet var buttons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            // let storyboard = UIStoryBoard(name: "MainViewViewController", bundle: nil)
        
        
            journalViewController = storyboard?.instantiateViewController(withIdentifier: "JournalViewController")
           // timeViewController = storyboard?.instantiateViewController(withIdentifier: "TimeViewController")
           // billingViewController = storyboard?.instantiateViewController(withIdentifier: "BillingViewController")
           // agendaViewController = storyboard?.instantiateViewController(withIdentifier: "AgendaViewController")
          //  profileViewController = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController")
            viewControllers = [journalViewController, /*timeViewController, billingViewController, agendaViewController,profileViewController*/]
      
            buttons[selectedindex].isSelected = true
            buttonPressed(buttons[selectedindex])
        
    }

   
    // MARK: Functions
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let previousIndex = selectedindex
        selectedindex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        let vc = viewControllers[selectedindex]
        addChildViewController(vc)
        
        vc.view.frame = manView.bounds
        manView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
}

