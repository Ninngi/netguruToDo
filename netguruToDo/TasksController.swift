//
//  TasksController.swift
//  netguruToDo
//
//  Created by Patryk Pawlak on 05/08/2019.
//  Copyright © 2019 Patryk Pawlak. All rights reserved.
//

import UIKit

class TasksController: UITableViewController {
    
    var taskStore: TaskStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        print("addTask")
        // Setting up allert controller
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert
        )
        
        // Set up the actions
        let addAction = UIAlertAction(title: "Add", style: .default) {_ in
            
            // Access text Field text
            guard let name = alertController.textFields?.first?.text else { return }
            
            // Create task
            let newTask = Task(name: name)
            
            // Add task
            self.taskStore.addTask(newTask, at: 0)
            
            // Reload data
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        addAction.isEnabled = false
        
        // Add the text field
        alertController.addTextField { textField in
            textField.placeholder = "Enter task name... "
            textField.addTarget(self, action: #selector(self.handleTextChanged), for: .editingChanged)
        }
        
        // Add the actions
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        // Present
        present(alertController, animated: true)
    }
    
    @objc private func handleTextChanged(_ sender: UITextField) {
        
        guard let alertController = presentedViewController as? UIAlertController,
              let addAction = alertController.actions.first,
              let text = sender.text
        else { return }
        
        // Enable "add action" if text is epty or whitespaces
        addAction.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
    }

}

// MARK:- DataScource
extension TasksController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "To-do" : "Done"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return taskStore.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        cell.textLabel?.text = taskStore.tasks[indexPath.section][indexPath.row].name
        return cell
    }
}

// MARK:- UI
extension TasksController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { in
            
            let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone
            
            self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
            
            // Reload table view
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        deleteAction.image = #imageLiteral(resourceName: "delete.png")
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(style: .normal, title: nil) { (action, sourceView, completionHandler) in
            <#code#>
        }
        
        return nil
    }
}
