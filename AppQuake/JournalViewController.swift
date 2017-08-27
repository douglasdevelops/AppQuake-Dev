//
//  JournalViewController.swift
//  AppQuake
//
//  Created by Johan Sas on 25-08-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit
import Firebase

class JournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // IBOutlets
    
    @IBOutlet weak var journalLabel: UILabel!
    @IBOutlet weak var navigationImage: UIImageView!
    @IBOutlet weak var journalTableView: UITableView!
    
    // Variables
    
    var journals = [JournalPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        journalTableView.delegate = self
        journalTableView.dataSource = self
        journalTableView.reloadData()
        self.automaticallyAdjustsScrollViewInsets = false
        
        downloadFromFirebase()
        
    }

    // MARK: TableView Setup
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let journal = journals[indexPath.row]
        if let cell: JournalCell = tableView.dequeueReusableCell(withIdentifier: "JournalsTableViewCell") as? JournalCell {
            cell.configureCell(journals: journal)
            return cell
        } else {
            return JournalCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return -10
    }

    
    // Functions
    
    func downloadFromFirebase() {
        DataService.instance.REF_JOURNAL.observe(.value, with: {(snapshot) in
            print(snapshot.value!)
            self.journals = []
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let journalDict = snapshot.value as? Dictionary<String, AnyObject> {
                        let journalKey = snap.key
                        print(self.journals)
                        if journalDict["owner"] as? String == userID {
                            
                           // debugPrint(journalDict)
                            debugPrint(journalDict["name"]!)
                            debugPrint(journalDict["date"]!)
                            debugPrint(journalDict["description"]!)
                            debugPrint(journalDict["hourlyPay"]!)
                            
                            let newJournal = JournalPost(name: journalDict["name"] as! String, date: journalDict["date"] as! String, description: journalDict["description"] as! String)
                            self.journals.append(newJournal)
                        }
                    }
                }
            }
            self.journalTableView.reloadData()
        })
    }
    
    @IBAction func showPopUpScreen(_ sender: Any) {
        let journalPopUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "journalPopUpViewController") as! JournalPopUpViewController
        self.addChildViewController(journalPopUpViewController)
        journalPopUpViewController.view.frame = self.view.frame
        self.view.addSubview(journalPopUpViewController.view)
        journalPopUpViewController.didMove(toParentViewController: self)
    }
}
