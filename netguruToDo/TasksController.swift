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
        
        // Set up the actions
        
        // Add the text field
        
        // Add the actions
        
        // Present
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
//        cell.backgroundColor = .white
        return cell
    }
}
