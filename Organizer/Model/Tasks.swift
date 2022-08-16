//
//  Tasks.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-07-08.
//

import Foundation
class Tasks {
    var name = ""
    var checked = false
    var category = ""
    var emoji = ""
    convenience init (name: String,category: String,emoji: String) {
        self.init()
        self.name = name
        self.category = category
        self.emoji = emoji
    }
}
