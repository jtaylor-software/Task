//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Jeremy Taylor on 11/11/20.
//

import UIKit

protocol ButtonTableViewCellDelegate: AnyObject {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    weak var delegate: ButtonTableViewCellDelegate?
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let delegate = delegate else {return}
        
        delegate.buttonCellButtonTapped(self)
    }
    
    func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}
