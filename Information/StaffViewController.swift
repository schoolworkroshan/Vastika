//
//  StaffViewController.swift
//  Information
//
//  Created by Roshan Lamichhane on 4/7/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//

import UIKit
import Parse



class StaffViewController: UIViewController, UISearchBarDelegate , UISearchDisplayDelegate {
    
    var arrayOfStudent = [[AnyObject]]()
   
    
   //var fetchedData = Dictionary<String, AnyObject>()
    override func viewDidLoad() {
        super.viewDidLoad()
        var userQuery = PFUser.query()
        userQuery.whereKey("Type", equalTo: "student")
        userQuery.findObjectsInBackgroundWithBlock { (user, error) -> Void in
            println(user)
            self.arrayOfStudent.append(user)
        }
        for object in arrayOfStudent {
            println(object)
        }
        
        
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
    

}
