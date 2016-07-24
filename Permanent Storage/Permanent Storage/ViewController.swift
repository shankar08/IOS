//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Shankar Prajapati on 7/23/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var MyLabel: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBAction func ChangeIt(sender: AnyObject) {
        
        MyLabel.text = userInput.text
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userInput.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
      //  NSUserDefaults.standardUserDefaults().setObject("Shanki", forKey: "name")
//        let myname = NSUserDefaults.standardUserDefaults().objectForKey("name") as! String
//        
//        print(myname)
//        
//        
//        let tempA = [1, 2, 3, 4, 5]
//        
//        NSUserDefaults.standardUserDefaults().setObject(tempA, forKey: "array")
//        
//        let dataA = NSUserDefaults.standardUserDefaults().objectForKey("array")! as! NSArray
//        
//        for x in dataA{
//            print(x)
//        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

}

