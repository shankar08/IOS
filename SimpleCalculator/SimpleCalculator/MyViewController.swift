//
//  MyViewController.swift
//  SimpleCalculator
//
/*
 //Create a simple calculator using array(operand stack) and
 data must be pushed in stack on pressing return and
 calculation must be done on pressing the operation(add,multiply,divide,subtract) buttons.
 Clr button will clear the texture as well as stack.
 
 //calculator must give result as float or double.
 
 */
//  Created by Shankar Prajapati on 8/13/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet var display: UITextField!
    
    var userIsTyping = false
    var operandStack:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func numberPressed(_ sender: AnyObject) {
        let digit = sender.currentTitle!
        if userIsTyping {
            display.text = display.text! + digit!
        } else {
            display.text = digit
            userIsTyping = true
        }
    }
    
    @IBAction func calculationButton(_ sender: AnyObject) {
        
        let button = sender.currentTitle!
        if userIsTyping {
            returnPressed()
        }
        switch button {
        case "×"?:
            performOperation {$0 * $1}
            break
            
        case "÷"?:
            if operandStack.removeLast() != 0 {
                performOperation {$1 / $0}
            } else {
                display.text = "Error"
            }
            
            break
            
        case "+"?:
            performOperation {$0 + $1}
            break
            
        case "-"?:
            performOperation {$1 - $0}
            break
        
        default:
            break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double){
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            returnPressed()
        }
    }
    
    private func performOperation(operation: (Double) -> Double){
        if operandStack.count >= 1{
            displayValue = operation(operandStack.removeLast())
            returnPressed()
        }
    }

    var displayValue: Double {
        get {
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
    
    @IBAction func clearPressed() {
        operandStack.removeAll()
        display.text = "0"
        userIsTyping = false
    }
    
    @IBAction func returnPressed() {
        userIsTyping = false
        operandStack.append(displayValue)
        print("operantStack = \(operandStack)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
