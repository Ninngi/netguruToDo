//
//  Task.swift
//  netguruToDo
//
//  Created by Patryk Pawlak on 05/08/2019.
//  Copyright © 2019 Patryk Pawlak. All rights reserved.
//

import UIKit

class Task {
    init(name: String, isDone: Bool = false) {
        self.name = name
        self.isDone = isDone
    }
    
    var name: String
    var isDone: Bool
}
