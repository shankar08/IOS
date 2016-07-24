//
//  SecondViewController.swift
//  To Do List
//
//  Created by Shankar Prajapati on 7/24/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var inputData: UITextField!
    
    @IBAction func AddToList(sender: AnyObject) {
        

//the data is added to the table
        //the text input field is set to empty
        toDoListData.append(inputData.text!)
        inputData.text = ""
        
        //the data is permanently aded to the array
        NSUserDefaults.standardUserDefaults().setObject(toDoListData, forKey: "toDoListData")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //these two fucntion below helps to minimize the keyboard by tapping outside the text input field and 
    //with return key
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }


}

