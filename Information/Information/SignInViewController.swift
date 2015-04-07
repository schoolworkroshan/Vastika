//
//  SignInViewController.swift
//  Information
//
//  Created by Roshan Lamichhane on 4/3/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//

import UIKit
import Parse



class SignInViewController: UIViewController, UITextFieldDelegate

{
    @IBOutlet weak var userName: UITextField!
    var student = [NSString]()
    @IBOutlet weak var passWord: UITextField!
    
    
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
       
         PFUser.logInWithUsernameInBackground(userName.text, password: passWord.text, block: { (user, error) -> Void in
            if(user != nil && self.student.count >=  1) {
                println("He is a student");
                self.performSegueWithIdentifier("studentSignIn", sender: self)
            }
            
            else if (user != nil && self.student.count == 0) {
                println("He is an admin")
                self.performSegueWithIdentifier("staffSignIn", sender: self)
            }
                
             else {
                println("Either password or username doesn't match")
            }
         })
    }
   
    
    
    @IBAction func signUp(sender: AnyObject) {
        self.performSegueWithIdentifier("signUp", sender: self)
    }
    
    
    //Enabling return key
    
     func textFieldShouldReturn(textField: UITextField!) -> Bool
     {
        
        textField.resignFirstResponder();
        var userQuery = PFUser.query()
        userQuery.whereKey("username", equalTo: self.userName.text)
        //userQuery.whereKey("password", equalTo: self.passWord.text)
        userQuery.whereKey("Type", equalTo: "student")
        userQuery.findObjectsInBackgroundWithBlock({ (users, error) -> Void in
            println(users)
            for PFUser in users {
                self.student.append(PFUser.username)
//                println(self.student)
            }
        })
        
        return true
    }
    
}


