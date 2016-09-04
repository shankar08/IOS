//
//  ViewController.swift
//  Tapper
//
//  Created by Shankar Prajapati on 8/27/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //Properties
    
    var maxCount = 0
    var currentCount = 0

    //outlets
    @IBOutlet weak var titleLogo: UIImageView!
    @IBOutlet weak var howManyTaps: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tabCounterLbl: UILabel!
    
    @IBAction func onPlayButtonPressed(sender:UIButton!){
        
        if howManyTaps.text != nil && howManyTaps.text != ""{
        titleLogo.hidden = true
        howManyTaps.hidden = true
        playButton.hidden = true
        
        tapButton.hidden = false
        tabCounterLbl.hidden = false
            
        maxCount = Int(howManyTaps.text!)!
        
        updateLabel()
        }
        
    }
    
    func updateLabel(){
        tabCounterLbl.text = "\(currentCount) Taps"
    }
    
    @IBAction func ontapButtonPressed(sender:UIButton!){
        currentCount += 1
        updateLabel()
        
        if isGameOver(){
            resetGame()
        }
    }
    
    func isGameOver() -> Bool{
        if currentCount >= maxCount {
            return true
        }else{
            return false
        }
    }
    
    func resetGame(){
        
        maxCount = 0
        howManyTaps.text = ""
        titleLogo.hidden = false
        howManyTaps.hidden = false
        playButton.hidden = false
        
        tapButton.hidden = true
        tabCounterLbl.hidden = true
        
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

