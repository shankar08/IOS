//
//  ViewController.swift
//  Letmepushmynotif
//
//  Created by Shankar Prajapati on 10/22/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
    
    }



}

