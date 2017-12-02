//
//  Website+CoreDataClass.swift
//  Core Data Challenge
//
//  Created by Andrew W Stoll on 12/1/17.
//  Copyright © 2017 Andrew W Stoll. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Website)
public class Website: NSManagedObject {
    convenience init?(name: String?, url: String?, summary: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Website.entity(), insertInto: managedContext)
        
        self.name = name
        self.url = url
        self.summary = summary
    }
}
