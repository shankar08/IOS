//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Shankar Prajapati on 7/24/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
       //this line of code below simply displays the web url in the web view
        webView.loadRequest(NSURLRequest(URL: url))
        
        /*
        //if we want to download the content and display in the screen, this chunk of codes does it
         
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            //will happen when task completes
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.webView.loadHTMLString(String(webContent!), baseURL: nil)
                    
                    
                    
                })
                
                
                
            } else {
                //show error message
            }
        }
        
        task.resume()
 */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

