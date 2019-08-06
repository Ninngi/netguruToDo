//
//  TaskUtility.swift
//  netguruToDo
//
//  Created by Patryk Pawlak on 06/08/2019.
//  Copyright © 2019 Patryk Pawlak. All rights reserved.
//

import UIKit

class TaskUtility {
    
    private static let key = "tasks"
    
    // archive
    private static func archiveData(_ tasks: [[Task]]) -> Data? {
        return try? NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
    }
    
    // fetch
    static func fetchData() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedData) as? [[Task]] ?? [[]]
    }
    
    // save
    static func saveData(_ tasks: [[Task]]) {
        // Archive
        let archivedTasks = archiveData(tasks)
        
        // Set object for key
        UserDefaults.standard.set(archivedTasks, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
