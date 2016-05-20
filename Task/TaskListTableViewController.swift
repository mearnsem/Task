//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Emily Mearns on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Functions
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(sender) else {
            return
        }
        let task = TaskController.sharedController.tasks[indexPath.row]
        sender.updateWithTask(task)
        sender.updateButton(true)
        TaskController.sharedController.saveToPersistentStore()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedController.tasks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as? ButtonTableViewCell ?? ButtonTableViewCell()
        let task = TaskController.sharedController.tasks[indexPath.row]
        cell.updateWithTask(task)
        cell.delegate = self
        
        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let task = TaskController.sharedController.tasks[indexPath.row]
            TaskController.sharedController.removeTask(task)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }    
    }


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toViewTask" {
            if let taskDetaiLVC = segue.destinationViewController as? TaskDetailTableViewController {
                if let taskCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(taskCell) {
                        taskDetaiLVC.task = TaskController.sharedController.tasks[indexPath.row]
                    }
                }
            }
        }
    }
 

}
