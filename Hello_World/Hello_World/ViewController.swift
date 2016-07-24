//
//  ViewController.swift
//  Hello_World
//
//  Created by Shankar Prajapati on 7/20/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textInput: UITextField!
    
    @IBOutlet var ActionLabel: UILabel!
    
    @IBAction func TryMe(sender: AnyObject) {
        
        let randomNum = String(arc4random_uniform(7))
        
        
        if textInput.text == randomNum{
            ActionLabel.text = "Correct guess"
        }
        else{
            ActionLabel.text = "Wrong guess,it is " + randomNum
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("this is my first swift")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

