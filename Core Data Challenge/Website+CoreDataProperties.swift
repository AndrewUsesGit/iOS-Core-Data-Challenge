//
//  Website+CoreDataProperties.swift
//  Core Data Challenge
//
//  Created by Andrew W Stoll on 12/1/17.
//  Copyright © 2017 Andrew W Stoll. All rights reserved.
//
//

import Foundation
import CoreData


extension Website {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Website> {
        return NSFetchRequest<Website>(entityName: "Website")
    }

    @NSManaged public var url: String?
    @NSManaged public var summary: String?
    @NSManaged public var name: String?

}
