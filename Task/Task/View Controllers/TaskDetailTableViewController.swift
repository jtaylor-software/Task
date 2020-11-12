//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Jeremy Taylor on 11/11/20.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    var dueDateValue: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New Task"
        updateViews()
        dueDateTextField.inputView = dueDatePicker

    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text,
              let notes = notesTextView.text,
              let date = dueDateValue else {return}
        
        if let task = task {
            // Update
            TaskController.shared.update(task: task, name: name, notes: notes, due: date)
        } else {
            // Create
            TaskController.shared.add(taskWithName: name, notes: notes, due: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateTextField.text = sender.date.stringValue()
        dueDateValue = sender.date
    }
    @IBAction func userTappedView(_ sender: Any) {
        taskNameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    func updateViews() {
        guard isViewLoaded,
              let task = task else { return}
        
        
        title = task.name
        taskNameTextField.text = task.name
        dueDateTextField.text = task.due?.stringValue()
        notesTextView.text = task.notes
    }
}
