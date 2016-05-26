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
    
//    var mockTasks: [Task] {
//        if let task1 = Task(name: "Grocery List", notes: "Bananas, Bread, Milk", due: NSDate(timeIntervalSinceNow: NSTimeInterval(60*60*24*8))),
//            let task2 = Task(name: "Homework", notes: nil, due: nil, isComplete: true) {
//            return [task1, task2]
//        } else {
//            return []
//        }
//    }
    
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
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("The task could not be saved.")
        }
    }
    
    func fetchTasks() -> [Task] {
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
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