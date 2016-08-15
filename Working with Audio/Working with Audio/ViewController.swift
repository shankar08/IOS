//
//  ViewController.swift
//  Working with Audio
//
//  Created by Shankar Prajapati on 8/13/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    let audioPath = Bundle.main.pathForResource("Combination", ofType: "mp3")!
    
    @IBOutlet var slider: UISlider!
    
    @IBAction func adjustVolume(_ sender: AnyObject) {
        player.volume = slider.value
        
    }
    @IBOutlet var scrubSlider: UISlider!
    
    @IBAction func scrub(_ sender: AnyObject) {
        player.currentTime = TimeInterval(scrubSlider.value)
    }
    
    @IBAction func play(_ sender: AnyObject) {
      player.play()
        
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: AnyObject) {
        
        player.pause()
        
        do {
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath) as URL)
        } catch {
            
            //process error here
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath) as URL)
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            //process error here
        }
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateSlider), userInfo: nil, repeats: true)   
    }

    func updateSlider() {
        
        scrubSlider.value = Float(player.currentTime)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

