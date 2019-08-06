//
//  TaskStore.swift
//  netguruToDo
//
//  Created by Patryk Pawlak on 05/08/2019.
//  Copyright © 2019 Patryk Pawlak. All rights reserved.
//

import UIKit

class TaskStore {
    
    var tasks = [[Task](), [Task]()]
    
    // add tasks
    func addTask(_ task: Task, at index: Int, isDone: Bool = false) {
        
        let section = isDone ? 1 : 0
        tasks[section].insert(task, at: index)
    }
    
    // remove tasks
    @discardableResult func removeTask(at index: Int, isDone: Bool = false) -> Task {
        
        let section = isDone ? 1 : 0
        return tasks[section].remove(at: index)
    }
}
