//
//  ViewController.swift
//  Table Views
//
//  Created by Shankar Prajapati on 7/23/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

   
    
    @IBOutlet var sliderValue: UISlider!
    
    @IBOutlet var table: UITableView!
    @IBAction func SliderValueChanged(sender: AnyObject) {
        table.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let timesTable = Int(sliderValue.value * 20)
        
        cell.textLabel?.text =  String(timesTable * (indexPath.row + 1 ))
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

