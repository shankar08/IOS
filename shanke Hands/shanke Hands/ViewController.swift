//
//  ViewController.swift
//  shanke Hands
//
//  Created by Shankar Prajapati on 8/19/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import CoreData

var myFriends = [Int]()

class ViewController: UIViewController, UITableViewDelegate {

   //var  myFriends = ["a", "b", "c"]
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
         let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
         
         newUser.setValue("lama", forKey: "firstName")
        newUser.setValue("cula", forKey: "lastName")
        newUser.setValue("Dell", forKey: "company")
        newUser.setValue("lamacula@dell.com", forKey: "emailID" )
        newUser.setValue("lala", forKey: "nickName")
        newUser.setValue("abc123", forKey: "password")
        newUser.setValue("Software Developer", forKey: "title")
        newUser.setValue(1001, forKey: "userID")
        newUser.setValue("I am a develope and I like to code", forKey: "shortInfo")
        newUser.setValue(32.778879, forKey: "userLatitude")
        newUser.setValue(-96.808790, forKey: "userLongitude")

         do {
         try context.save()
         } catch {
         print("Couldnot save")
         
         }
         
        
        let request = NSFetchRequest(entityName: "Users")
        
        
        //we use predicate to search partifular item in the database
        
           request.predicate = NSPredicate(format: "firstName = %@", "lama")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
               
                for result in results as! [NSManagedObject]{
                    
                    /*
                     context.deleteObject(result)
                     
                     // result.setValue("Manda", forKey: "firstname")
                     
                     do {
                     try context.save()
                     }catch {
                     
                     }
                     
                     */
                    if let firstname = result.valueForKey("firstName") as? String {
                        print (firstname)
                    }
                    
                    //   print(result.valueForKey("firstname")!)
                    //   print(result.valueForKey("lastname")!)
                }
                
                
            }
            
        }catch {
            
            print("Results couldnot be fetched")
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //this function defines how many rows will be in the table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
      //  return myFriends.count
        return 1
        
    }
    
    //this funciton defines how the data in the cell is  being populated
    //the cell with the data is returned
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
    //    cell.textLabel?.text = myFriends[indexPath.row]
        
        return cell
        
    }
    

    override func viewWillAppear(animated: Bool) {
        myTableView.reloadData()
    }
    
 
    


}

