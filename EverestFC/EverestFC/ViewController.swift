//
//  ViewController.swift
//  EverestFC
//
//  Created by Shankar Prajapati on 9/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fbBtnPressed(sender: UIButton!){
        let facebookLogin = FBSDKLoginManager()
        
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookResult:FBSDKLoginManagerLoginResult!, facebookError: NSError!) in
                        if facebookError != nil {
                            print("Facebook Login failed. Error \(facebookError)")
            
                        }else {
                            let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                            print("Successfully logged in with facebook. \(accessToken)")
                        }
        }

    }


}

