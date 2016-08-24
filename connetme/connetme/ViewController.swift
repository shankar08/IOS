//
//  ViewController.swift
//  Core Data
//
//  Created by Shankar Prajapati on 8/17/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import CoreData

var myFriends = [1002, 1004, 1006, 1007, 1005,1003]
var friendsName = [String]()

class ViewController: UIViewController, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        
        let request = NSFetchRequest(entityName: "Users")
                //we use predicate to search partifular item in the database
        for number in myFriends{
            request.predicate = NSPredicate(format: "userID == %i", number)
            
            request.returnsObjectsAsFaults = false
            
            do {
                let results = try context.executeFetchRequest(request)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject]{
                        
                        var friendFirst  = result.valueForKey("firstName") as? String
                        var friendLast  = result.valueForKey("lastName") as? String
                        var friendTitle  = result.valueForKey("title") as? String
                        friendsName.append(friendFirst! + " " + friendLast! + " | " + friendTitle!)
                        
                        //   print(result.valueForKey("lastName")!)
                    }
                }
                
            }catch {
                
                print("Results couldnot be fetched")
                
            }
            
        }
   
    }
    
    //this function defines how many rows will be in the table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        //  return myFriends.count
        return friendsName.count
        
    }
    
    //this funciton defines how the data in the cell is  being populated
    //the cell with the data is returned
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
            cell.textLabel?.text = String(friendsName[indexPath.row])
        
        return cell
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


/*
 
 // print (result)
 
 /*
 context.deleteObject(result)
 
 // result.setValue("Manda", forKey: "firstname")
 
 do {
 try context.save()
 }catch {
 
 }
 */
 //                    if let firstname = result.valueForKey("firstName") as? String {
 //                        print (firstname)
 //                    }
 
 //   print(result.valueForKey("firstname")!)
 //
 
 ///////////////////////////////////
 
 
 //        let newUser1 = NSEntityDescription.insertNewObjectForEntityForName("FriendList", inManagedObjectContext: context)
 //
 //        newUser1.setValue(1004, forKey: "friendUserID")
 //        newUser1.setValue(true, forKey: "isActive")
 //        newUser1.setValue(32.778879, forKey: "latitude")
 //        newUser1.setValue(-96.808790, forKey: "longitude" )
 //        newUser1.setValue(1002, forKey: "mainUserID")
 //
 
 //         do {
 //            try context.save()
 //         } catch {
 //            print("Couldnot save")
 //
 //         }
 
 */





//
//        let request = NSFetchRequest(entityName: "FriendList")
//        //we use predicate to search partifular item in the database
//
//        request.predicate = NSPredicate(format: "mainUserID == %i", 1002)
//
//        request.returnsObjectsAsFaults = false
//
//        do {
//            let results = try context.executeFetchRequest(request)
//
//            if results.count > 0 {
//
//                for result in results as! [NSManagedObject]{
//
//
//                    if let friendID  = result.valueForKey("friendUserID")?.integerValue{
//                        myFriends.append(Int32(friendID))
//                    }
//
//     //   print(result.valueForKey("lastName")!)
//                }
//            }
//
//        }catch {
//
//            print("Results couldnot be fetched")
//
//        }

//      print(myFriends)

//////
// let context: NSManagedObjectContext = appDel.managedObjectContext

//        let requestFor = NSFetchRequest(entityName: "Users")
//
//      //  for friends in myFriends {
//            requestFor.predicate = NSPredicate(format: "userID == %i", 1003)
//
//
//            do {
//                let results2 = try context.executeFetchRequest(requestFor) as! [NSManagedObject]
//
//                if results2.count > 0 {
//                 //   var localName = ""
//                  print(results2.va)
//                   // friendsName.append(results2)
//
//            }
//
//            }catch {
//
//                print("Results couldnot be fetched")
//
//            }
//     //   }
