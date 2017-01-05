//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Shankar Prajapati on 9/25/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet var titleLbl: UILabel!
    private var _partyRock: PartyRocks!
    
    var partyRock: PartyRocks{
        get{
            return _partyRock
        }set {
            _partyRock = newValue
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
    }
    @IBAction func backBtn(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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
