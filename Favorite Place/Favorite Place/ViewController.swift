//
//  ViewController.swift
//  Favorite Place
//
//  Created by Shankar Prajapati on 9/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var findOutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findOutButton.layer.cornerRadius = 10.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

