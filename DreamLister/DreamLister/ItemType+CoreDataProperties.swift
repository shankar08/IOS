//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Shankar Prajapati on 9/27/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import Foundation
import CoreData
//import

extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
