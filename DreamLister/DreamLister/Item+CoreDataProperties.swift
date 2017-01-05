//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by Shankar Prajapati on 9/27/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import Foundation
import CoreData
//import

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var price: Double
    @NSManaged public var title: String?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}
