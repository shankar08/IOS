//
//  ViewController.swift
//  Media
//
//  Created by Shankar Prajapati on 7/25/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myImage: UIImageView!
    var counter = 1
    var timer = NSTimer()
    
    var isAnimating = true
    @IBAction func makeamove(sender: AnyObject) {
       
        
        if isAnimating == true{
            timer.invalidate()
            
            isAnimating = false
        }else {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            
            isAnimating = true
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doAnimation(){
        
        
        if counter == 4 {
            counter = 1
        }else{
            counter += 1
        }
        
         myImage.image = UIImage(named: "dance\(counter).tiff")
    }
   
    /*
    //view has been created but yet to be displayed
    override func viewDidLayoutSubviews() {
       // myImage.center = CGPointMake(myImage.center.x-400, myImage.center.y)
        myImage.alpha = 0
    }
    
    //just when the view appear in the screen
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(2) {
          self.myImage.alpha = 1
            
            //self.myImage.center = CGPointMake(self.myImage.center.x+400, self.myImage.center.y)
        }
    }
 */


}

