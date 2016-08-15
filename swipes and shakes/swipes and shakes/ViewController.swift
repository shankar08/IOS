//
//  ViewController.swift
//  swipes and shakes
//
//  Created by Shankar Prajapati on 8/13/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["baby", "belach", "bizarre", "caroon", "chinese", "Chipmunks", "Cinematic","dogpanting", "European", "Fart", "FartSqueeze", "foghorn", "FunnyBoy", "funnyvoices","hahaha", "handcuffs", "oldrecord", "puppybarking", "SickVillain", "SteamEngine", "wind"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
/*
        // swipe codes
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
 
 
 */
        
    }
    /*
    func swiped(gesture: UISwipeGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped Right")
                
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped Up")
            
            default:
                break
            }
        }
    }
 
 */
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake{
         
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let audioPath = Bundle.main.pathForResource(sounds[randomNumber], ofType: "mp3")

  
            do {
                try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
                 player.play()
            } catch{}
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

