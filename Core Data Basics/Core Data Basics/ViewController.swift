//
//  ViewController.swift
//  Core Data Basics
//
//  Created by Shankar Prajapati on 8/15/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //used to connect to core data
        let appDel: AppDelegate = UIApplication.shared().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        //adding a user to  database
        let newUser = Users(context: context)
        newUser.setValue("Rob", forKey: "username")
        
        newUser.setValue("pass123", forKey: "password")
        
        
        do {
            try context.save()
            
        } catch {
            
            print("There was a problem")
        }
        
        
        
        // let request: NSFetchRequest<NSFetchRequestResult> = Users.fetchRequest()
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Users")
       // let fetchRequest:NSFetchRequest<Users> = Users.fetchRequest()
        
        fetchRequest.returnsObjectsAsFaults = false
        
        if let users = try? fetchRequest.execute() {
            
            print(users)
        }
//                do{
//        
//                    let results = try fetchRequest.execute()
//                    print(results)
        
//                } catch {
//                    print("fetching failed")
//                }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

