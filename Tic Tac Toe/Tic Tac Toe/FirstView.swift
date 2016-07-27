//
//  FirstView.swift
//  Tic Tac Toe
//
//  Created by Shankar Prajapati on 7/27/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit


var first = ""
var second = ""

class FirstView: UIViewController {
    
    
  
    @IBOutlet var firstPlayer: UITextField!
    @IBOutlet var secondPlayer: UITextField!
    
    @IBAction func playPressed(_ sender: AnyObject) {
        
        first = firstPlayer.text!
        second = secondPlayer.text!
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Progress")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

}
