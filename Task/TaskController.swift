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
        _ = Task(name: name, isComplete: false)
        saveToPersistentStore()
    }
    
    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
            saveToPersistentStore()
        }
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        task.notes = notes
        task.name = name
        task.due = due
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Your task could not be saved.")
        }
    }
    
    func fetchTasks() -> [Task] {
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
    }
}






