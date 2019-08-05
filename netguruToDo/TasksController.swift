//
//  TasksController.swift
//  netguruToDo
//
//  Created by Patryk Pawlak on 05/08/2019.
//  Copyright © 2019 Patryk Pawlak. All rights reserved.
//

import UIKit

class TasksController: UITableViewController {
    
    var taskStore = TaskStore()
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        print("addTask")
        // Setting up allert controller
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert
        )
        
        // Set up the actions
        let addAction = UIAlertAction(title: "Add", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // Add the text field
        alertController.addTextField { textField in
            textField.placeholder = "Enter task name... "
        }
        
        // Add the actions
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        // Present
        present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todoTasks = [Task(name: "Cześć"), Task(name: "Co tam słychać"), Task(name: "Idziesz spać juszzzz ?")]
        let doneTasks = [Task(name: "Bye"), Task(name: "Wszystko OK!"), Task(name: "ale się wyspałem!")]
    
        taskStore.tasks = [todoTasks, doneTasks]
    }
}

// MARK:- DataScource
extension TasksController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }

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
