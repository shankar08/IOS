//
//  TableViewController.swift
//  Memorable Places
//
//  Created by Shankar Prajapati on 8/8/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

var places = [Dictionary<String, String>()]

var toDoListData = [String]()

var activePlace = -1
class TableViewController: UITableViewController {

    @IBOutlet var tabledata: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "toDoListData") != nil {
            
            //storing the data permanently
            
            toDoListData = UserDefaults.standard.object(forKey: "toDoListData") as! [String]

            
        }
     
        if places.count == 1 {
            places.remove(at: 0)
            places.append(["name":"Taj Mahal", "lat":"27.175277","lon":"78.0442128"])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

         //Configure the cell...
        
        cell.textLabel?.text = places[indexPath.row]["name"]

        return cell
    }
    

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        activePlace = indexPath.row
        
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newPlace" {
            activePlace = -1
        }
    }
 
    
    
//    //this function enables the swipe delete button in the cell of the table view
//    private func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath){
//        
//        if editingStyle == UITableViewCellEditingStyle.delete {
//            toDoListData.remove(at: (indexPath as NSIndexPath).row)
//            
//            UserDefaults.standard.set(toDoListData, forKey: "toDoListData")
//            tabledata.reloadData()
//        }
//    }
 
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
