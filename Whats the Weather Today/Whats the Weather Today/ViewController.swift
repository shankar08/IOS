//
//  ViewController.swift
//  Whats the Weather Today
//
//  Created by Shankar Prajapati on 7/24/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var CityTextInput: UITextField!
    @IBAction func FindWeather(sender: AnyObject) {
        
        
            var wasSuccessful = false

            //creating the url to get the data from specific city
            let Attemptedurl = NSURL(string:"http://www.weather-forecast.com/locations/" + CityTextInput.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest" )
        
            if let url = Attemptedurl {
            
                let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                    //checking if we have some data
                    //if we have data then assign it to urlContent
                    if let urlContent = data{
                    
                        //Converting the coded data into clean HTML code
                        let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                        //parsing the content of the webiste
                        let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                        if websiteArray?.count > 1{
                            //   print(websiteArray![1])
                        
                            let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                        
                            if weatherArray.count > 1{
                            
                                wasSuccessful = true
                            
                                //we are getting the final summaary of the information and we are replacing the &deg with º in the data
                            
                                let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                            
                                //this makes it happen nice and quickly
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    self.resultLabel.text = weatherSummary
                                })
                                
                            }
                        
                        }
                    
                    }
                   
                }
                if wasSuccessful == false{
                    self.resultLabel.text = "Couldnot find the weather for that city - please try again."
                
                }
        
                task.resume()
            
          
            
            }
            else {
                self.resultLabel.text = "Couldnot find the weather for that city - please try again."
            
            }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(resultLabel: UITextField!) -> Bool
    {
        resultLabel.resignFirstResponder()
        return true
    }


}

