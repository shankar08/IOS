//
//  ViewController.swift
//  StopWatch
//
//  Created by Shankar Prajapati on 7/22/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var time = 0
    var timer = NSTimer()
    
    @IBOutlet var DisplayLabel: UILabel!
    @IBAction func Start(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timeClicker"), userInfo: nil, repeats: true)
    }

    
    @IBAction func Pause(sender: AnyObject) {
        timer.invalidate()
    }
  
    @IBAction func Stop(sender: AnyObject) {
        timer.invalidate()
        time = 0
        
        DisplayLabel.text = "0"
    }
    
    
    func timeClicker(){
        
        time += 1
        
        DisplayLabel.text = String(time)
        
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

