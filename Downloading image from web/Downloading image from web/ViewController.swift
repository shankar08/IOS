//
//  ViewController.swift
//  Downloading image from web
//
//  Created by Shankar Prajapati on 8/18/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://images-na.ssl-images-amazon.com/images/I/61GXQ2UTHPL._SL1024_.jpg")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) in
            if error != nil {
                print (error)
            }else {
                
                if let back = UIImage(data: data!){
                   // self.image.image = back
                    
                    var documentsDir:String?
                    
                    var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                    
                    if paths.count > 0 {
                        documentsDir = paths[0] as? String
                        
                        var savePath = documentsDir! + "/back.jpg"
                        
                        
                        //save the image
                        NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                        
                        self.image.image = UIImage(named: savePath)
                    }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

