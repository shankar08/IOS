//
//  FirstViewController.swift
//  To Do List
//
//  Created by Shankar Prajapati on 7/24/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

//declaring an array of string outside the class to make it universally accessible
var toDoListData = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    //tableData connection
    @IBOutlet var tabledata: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        //checking if there is already data in the toDoListData
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoListData") != nil {
    
        //storing the data permanently 
            
        toDoListData = NSUserDefaults.standardUserDefaults().objectForKey("toDoListData") as! [String]
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this function defines how many rows will be in the table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return toDoListData.count
        
    }
    
    //this funciton defines how the data in the cell is  being populated 
    //the cell with the data is returned
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoListData[indexPath.row]
        
        return cell
    }
    
    //this function enables the swipe delete button in the cell of the table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoListData.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoListData, forKey: "toDoListData")
            tabledata.reloadData()
        }
    }
    
    //this function refresh the view each time the view appreas with the updated data
    override func viewDidAppear(animated: Bool) {
        tabledata.reloadData()
    }


}

