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
        self.tasks = fetchTasks()
    }
    
    var mockTasks: [Task] {
        let task1 = Task(name: "Grocery List", notes: "Bananas, Bread, Milk", due: NSDate(timeIntervalSinceNow: NSTimeInterval(60*60*24*8)))
        let task2 = Task(name: "Homework", notes: nil, due: nil, isComplete: true)
        return [task1!, task2!]
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
        return mockTasks
    }
    
    var completedTasks: [Task] {
        let moc = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "Task")
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        return tasks.filter({$0.isComplete.boolValue})
    }
    
    var incompleteTasks: [Task] {
        let moc = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "Task")
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        return tasks.filter({!$0.isComplete.boolValue})
    }
    
}