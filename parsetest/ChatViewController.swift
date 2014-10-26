//
//  ChatViewController.swift
//  parsetest
//
//  Created by Anuj Goyal on 10/26/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //self.navigationController?.navigationItem.title = "Chats"
    }
    
    @IBAction func onSend(sender: AnyObject) {
        var msg = PFObject(className: "Message")
        msg["text"] = chatTextField.text
        msg.saveInBackgroundWithBlock { (didSave: Bool, error: NSError!) -> Void in
            if didSave {
                NSLog("message saved: \(self.chatTextField.text)")
            } else {
                NSLog("error: \(error)")
            }
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
