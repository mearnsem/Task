//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Emily Mearns on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    var task: Task?
    var delegate: ButtonTableViewCellDelegate?
    
    // MARK: - IBOutlets & Properties

    @IBOutlet var primaryLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    // MARK: - IBActions

    @IBAction func buttonTapped(sender: AnyObject) {
        delegate?.buttonCellButtonTapped(self)
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
        updateButton(task.isComplete.boolValue)
    }
}