//
//  BlueVC.swift
//  segues
//
//  Created by Shankar Prajapati on 9/24/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class BlueVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGray
        
    }

    @IBAction func backBtnPressed(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func letsDanceBtnpressed(_ sender: AnyObject) {
        let songTitle = "I am bored today"
        //this function performs the segue programmatically 
        performSegue(withIdentifier: "iamDancing", sender: songTitle)
        
    }

    //this function is called before calling the view did load in another view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? letsDanceVC {
            if let song = sender as? String {
                destination.selecteSong = song
            }
        }
    }
 
   

}
