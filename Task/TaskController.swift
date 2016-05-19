//
//  TaskController.swift
//  Task
//
//  Created by Emily Mearns on 5/19/16.
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
        let task1 = Task(name: "Clean kitchen", isComplete: true)
        let task2 = Task(name: "Code hw", notes: "Task project", due: NSDate(), isComplete: false)
        return [task1, task2]
    }
    
    var completedTasks: [Task] {
        let request = NSFetchRequest.init(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        let completedTasks = tasks.filter({$0.isComplete == true})
        return completedTasks
    }
    
    var incompleteTasks: [Task] {
        let request = NSFetchRequest.init(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        let incompleteTasks = tasks.filter({$0.isComplete == false})
        return incompleteTasks
    }
    
    func addtask(name: String, notes: String?, due: NSDate?) {
        
    }
    
    func removeTask(task: Task) {
        
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        
    }
    
    func saveToPersistentStore() {
        
    }
    
    func fetchTasks() -> [Task] {
        return mockTasks
    }
}






