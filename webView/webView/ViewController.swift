//
//  ViewController.swift
//  webView
//
//  Created by Shankar Prajapati on 8/22/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        var url = NSURL(string: "http://ecowebhosting.co.uk")
        
        var request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        */
        
        
        var html = "<html><body><h1> My Page</h1><p>This is my page.</p></body></html>"
        
        webView.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

