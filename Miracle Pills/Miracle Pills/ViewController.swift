//
//  ViewController.swift
//  Miracle Pills
//
//  Created by Shankar Prajapati on 9/21/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var stateLabelTest: UILabel!
    @IBOutlet var statePicker: UIPickerView!
    
    @IBOutlet var statePickerBtn: UIButton!
    
    let states = ["Alaska", "Arkansas", "Texas", "Alabama", "Colorado", "Virginia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func statePickClick(_ sender: AnyObject) {
        statePicker.isHidden = false
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        stateLabelTest.text = states[row]
        statePicker.isHidden = true
    }
    
}

