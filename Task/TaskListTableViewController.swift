//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Emily Mearns on 5/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, ButtonTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskController.sharedController.fetchedResultsController.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let sections = TaskController.sharedController.fetchedResultsController.sections else {return 0}
        return sections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = TaskController.sharedController.fetchedResultsController.sections else {return 0}
        return sections[section].numberOfObjects
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as? ButtonTableViewCell

        guard let task = TaskController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Task else {return ButtonTableViewCell()}
        cell?.updateWithTask(task)
        cell?.delegate = self
        return cell ?? ButtonTableViewCell()
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = TaskController.sharedController.fetchedResultsController.sections, index = Int(sections[section].name) else {return nil}
        if index == 0 {
            return "Incomplete"
        } else {
            return "Complete"
        }
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            guard let task = TaskController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Task else {return}
            TaskController.sharedController.removeTask(task)
        }    
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toViewTask" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let destinationVC = segue.destinationViewController as? TaskDetailTableViewController
            guard let task = TaskController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Task else {return}
            destinationVC?.task = task
        }
    }
    
    // MARK: - ButtonTableViewCellDelegate
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        guard let task = sender.task else {return}
        TaskController.sharedController.buttonToggleValueChange(task)
        tableView.reloadData()
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Delete:
            guard let indexPath = indexPath else {return}
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        case .Insert:
            guard let newIndexPath = newIndexPath else {return}
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
        case .Move:
            guard let indexPath = indexPath, newIndexPath = newIndexPath else {return}
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
        case .Update:
            guard let indexPath = indexPath else {return}
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Automatic)
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Automatic)
        default:
            break
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
}







