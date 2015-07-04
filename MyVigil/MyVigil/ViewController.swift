//
//  ViewController.swift
//  MyVigil
//
//  Created by Nivethitha Kumar on 7/3/15.
//  Copyright (c) 2015 Nivethitha Kumar. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController,MFMessageComposeViewControllerDelegate {
    
    @IBAction func sendMessage(sender: AnyObject) {
        println("*****In sendMessage *******")
        var messageVC = MFMessageComposeViewController()
        println("****After Message Compose View Controller **** " )
        
        messageVC.body = "Hey this is a test message by myVigil";
        messageVC.recipients = ["4082193595"]
        messageVC.messageComposeDelegate = self;
       
        dispatch_async(dispatch_get_main_queue(),{
        println(messageVC.body)
        self.presentViewController(messageVC, animated: false, completion: nil)
        })
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        switch (result.value) {
        case MessageComposeResultCancelled.value:
            println("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.value:
            println("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.value:
            println("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
            let helpVC:HelpViewController = HelpViewController()
           // let helpVC:HelpViewController=self.storyboard!.instantiateViewControllerWithIdentifier("HelpViewController")
         //   helpVC.view.backgroundColor=UIColor.redColor()
          
            self.presentViewController(helpVC, animated: true, completion: nil)


            
        default:
            break;
        }
    }
    
    
}

