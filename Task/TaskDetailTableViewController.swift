//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Emily Mearns on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    //MARK: - IBOutlets & Properties
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dueDateTextField: UITextField!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var task: Task?
    var dueDateValue: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        if let task = task {
            updateWithTask(task)
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        TaskController.sharedController.saveToPersistentStore()
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        dueDatePicker.calendar = 
    }
    
    @IBAction func userTappedView(sender: AnyObject) {
        nameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
        dueDatePicker.resignFirstResponder()
    }
    
    //MARK: - Functions
    
    func updateWithTask(task: Task) {
        self.task = task
        
        self.nameTextField.text = task.name
        self.dueDateTextField.text = task.due?.stringValue()
        self.notesTextView.text = task.notes
    }
    
    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
