//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Emily Mearns on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var dueDateValue: NSDate?
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        if let task = task {
            updateWithTask(task)
        }
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let task = task {
            TaskController.sharedController.updateTask(task, name: nameTextField.text ?? "", notes: notesTextView.text, due: dueDatePicker.date, isComplete: task.isComplete.boolValue)
        } else {
            TaskController.sharedController.addTask(nameTextField.text ?? "", notes: notesTextView.text, due: dueDatePicker.date)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        self.dueDateTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(sender: AnyObject) {
        self.nameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
    }
    
    func updateWithTask(task: Task) {
        self.task = task
        nameTextField.text = task.name
        if let due = task.due {
            dueDateTextField.text = due.stringValue()
        }
        if let notes = task.notes {
            notesTextView.text = notes
        }
    }

}
