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
//    private static let encoder =
    // archive
    private static func archive(_ tasks: [[Task]]) -> Data? {
        return try? NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
    }
    
    // fetch
    static func fetch() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedData) as? [[Task]]
    }
    
    // save
    static func saveData(_ tasks: [[Task]]) {
        // Archive
        let archivedTasks = archive(tasks)
        
        // Set object for key
        UserDefaults.standard.set(archivedTasks, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
