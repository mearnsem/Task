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
    
    var tasks: [Task] = []
    
    init() {
    
    }
    
    func addTask(name: String, notes: String?, due: NSDate?) {
        
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        
    }
    
    func removeTask(task: Task) {
        
    }
    
    func saveToPersistentStore() {
        
    }
    
    func fetchTasks() -> [Task] {
        
    }
    
    var completedTasks: [Task] {
        let moc = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "Task")
        var tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        for task in tasks {
            if task.isComplete == true {
                tasks.append(task)
            }
        }
        return tasks
    }
    
    var incompleteTasks: [Task] {
        let moc = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "Task")
        var tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        for task in tasks {
            if task.isComplete == false {
                tasks.append(task)
            }
        }
        return tasks
    }
    
}