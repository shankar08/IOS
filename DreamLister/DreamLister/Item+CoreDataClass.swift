//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Shankar Prajapati on 9/27/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
        
    }

}
