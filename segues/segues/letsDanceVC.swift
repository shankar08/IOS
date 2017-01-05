//
//  letsDanceVC.swift
//  segues
//
//  Created by Shankar Prajapati on 9/24/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class letsDanceVC: UIViewController {
    
    private var _selectedSong: String!
    
    @IBOutlet var songTitle: UILabel!
    
    var selecteSong: String {
        get{
            return _selectedSong
        } set {
            _selectedSong = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        songTitle.text = _selectedSong
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
