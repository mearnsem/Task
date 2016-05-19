//
//  Task.swift
//  Task
//
//  Created by Emily Mearns on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

    convenience init(name: String, notes: String? = nil, due: NSDate? = nil, isComplete: Bool, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
}
