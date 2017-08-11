//
//  ViewController.swift
//  my awesome app
//
//  Created by HGPMAC22 on 7/21/17.
//  Copyright © 2017 HGPMAC22. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText:UITextField!
    @IBOutlet weak var segmentControl:UISegmentedControl!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func action(_ sender: UIButton)
    {
        print("GEtting hit in action....")
        if emailText.text != "" && passwordText.text != ""
        {
            if segmentControl.selectedSegmentIndex == 0 //Login user
            {
                Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { (user,error) in
                    if user != nil
                    {
                        //Sign in successful
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }
                    else
                    {
                       if let myError = error?.localizedDescription
                       {
                          print(myError)
                       }
                       else
                       {
                           print("ERROR")
                       }
                    }
                })
            }
            else //Sign up user
            {
                Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user,error) in
                    if user != nil
                    {
                      self.performSegue(withIdentifier: "segue", sender: self)
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR")
                        }
                    }
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

