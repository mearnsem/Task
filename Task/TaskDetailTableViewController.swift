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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        
    }
    
    func updateWithTask(task: Task) {
        nameTextField.text = task.name
        dueDateTextField.text = task.due
        notesTextView.text = task.notes
    }

}
