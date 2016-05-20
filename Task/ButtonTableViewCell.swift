//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Emily Mearns on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    var task: Task?
    
    // MARK: - IBOutlets & Properties

    @IBOutlet var primaryLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    // MARK: - IBActions

    @IBAction func buttonTapped(sender: AnyObject) {
        
    }
    
    // MARK: - Functions 
    func updateButton(isComplete: Bool) {
        if isComplete == true {
            button.setImage(UIImage(named: "complete"), forState: UIControlState.Normal)
        } else {
            button.setImage(UIImage(named: "incomplete"), forState: UIControlState.Normal)
        }
    }
}

extension ButtonTableViewCell {
    func updateWithTask(task: Task) {
        self.task = task
        
        self.primaryLabel.text = task.name
        //UPDATE IMAGE
    }
}