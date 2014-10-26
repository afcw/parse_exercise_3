//
//  LoginViewController.swift
//  parsetest
//
//  Created by Anuj Goyal on 10/26/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // self.navigationController?.navigationItem.title = "Chats"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // https://parse.com/docs/ios_guide#users-signup/iOS
    @IBAction func onSignUp(sender: AnyObject) {
        
            var user = PFUser()
            user.username = emailTextField.text // "agoyal2015"
            user.password = passwordTextField.text
            user.email = emailTextField.text
            // other fields can be set just like with PFObject
            user["phone"] = "415-572-9112"
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, error: NSError!) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                    NSLog("Sign Up Worked!")
                } else {
                    NSLog("Sign Up Failed :( ")
                    //let errorString = error.userInfo["error"] as NSString
                    // Show the errorString somewhere and let the user try again.
                }
            }

    }


    @IBAction func onSignIn(sender: AnyObject) {

        var login = emailTextField.text
        var pwd = passwordTextField.text
        
        PFUser.logInWithUsernameInBackground(login, password: pwd,
            block: {(user: PFUser!, error: NSError!) -> Void in
                
                if user != nil {
                    // do stuff
                    NSLog("login succeeded")
                    self.performSegueWithIdentifier("chatSegue", sender: self)
                    
                } else {
                    // The login failed. Check error to see why.
                    NSLog("login failed: \(error)")
                }
                
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("Segue called: \(segue.identifier)")
        
        if segue.identifier == "chatSegue" {
            var destinationViewController = segue.destinationViewController as UINavigationController
            NSLog("dest: \(destinationViewController)")
            
            NSLog("foo2")
            //destinationViewController.pmImage = self.imageView.imageView.image
        }
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
