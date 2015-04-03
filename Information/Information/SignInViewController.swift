//
//  SignInViewController.swift
//  Information
//
//  Created by Roshan Lamichhane on 4/3/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func signIn(sender: AnyObject) {
        
    }
    
    
    @IBAction func signUp(sender: AnyObject) {
        self.performSegueWithIdentifier("signUp", sender: self)
    }
    
    
    //Enabling return key
    
     func textFieldShouldReturn(textField: UITextField!) -> Bool
     {
        textField.resignFirstResponder();
        return true
    }
    
}
