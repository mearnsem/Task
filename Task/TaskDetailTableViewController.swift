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
        self.dueDateTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(sender: AnyObject) {
        self.nameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
        self.dueDatePicker.resignFirstResponder()
    }
    
    //MARK: - Functions
    
    func updateWithTask(task: Task) {
        self.task = task
        
        self.nameTextField.text = task.name
        self.dueDateTextField.text = task.due?.stringValue()
        self.notesTextView.text = task.notes
    }

}
