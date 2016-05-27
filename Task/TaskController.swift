//
//  TaskController.swift
//  Task
//
//  Created by Emily Mearns on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    let fetchedResultsController: NSFetchedResultsController
    
    init() {
        let request = NSFetchRequest(entityName: "Task")
        let isCompleteSortDescriptor = NSSortDescriptor(key: "isComplete", ascending: false)
        let dueSortDescriptor = NSSortDescriptor(key: "due", ascending: false)
        request.sortDescriptors = [isCompleteSortDescriptor, dueSortDescriptor]
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "isComplete", cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Error fetching content")
        }
    }
    
    func addTask(name: String, notes: String?, due: NSDate?) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func removeTask(task: Task) {
        task.managedObjectContext?.deleteObject(task)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("The task could not be saved.")
        }
    }
    
    func buttonToggleValueChange(task: Task) {
        task.isComplete = !task.isComplete.boolValue
        saveToPersistentStore()
    }
    
}