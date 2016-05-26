//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Emily Mearns on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        TaskController.sharedController.saveToPersistentStore()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedController.tasks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as? ButtonTableViewCell

        let task = TaskController.sharedController.tasks[indexPath.row]
        cell?.updateWithTask(task)
        cell?.delegate = self
        return cell ?? ButtonTableViewCell()
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
            if let taskDetailVC = segue.destinationViewController as? TaskDetailTableViewController {
                if let taskCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(taskCell) {
                        taskDetailVC.task = TaskController.sharedController.tasks[indexPath.row]
                    }
                }
            }
        }
    }
    

}
