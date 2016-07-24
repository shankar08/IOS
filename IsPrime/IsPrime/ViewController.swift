//
//  ViewController.swift
//  IsPrime
//
//  Created by Shankar Prajapati on 7/21/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var InputNumber: UITextField!
    @IBOutlet var outPutLabel: UILabel!
    
    @IBAction func CheckButton(sender: AnyObject) {
        if let number = Int(InputNumber.text!){
            var isPrime = true
            
            if number == 1{
                isPrime = false
        }
            if number != 2 && number != 1 {
                for var i = 2.0; i < sqrt(Double(number)) ; i = i+1.0 {
                    if(number % Int(i) == 0){
                        isPrime = false
                    }
                }
            }
            
            if(isPrime){
                outPutLabel.text = "Number \(number) is Prime"
            }else{
                outPutLabel.text = "number \(number) is not Prime"
            }
            
            
        }
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

