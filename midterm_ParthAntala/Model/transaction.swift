//
//  transaction.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-07-08.
//

import Foundation
class Transaction {
    var name = ""
    var category = ""
    var amount = 0
    var date: Date?
    convenience init (name: String,category: String, amount: Int, date: Date) {
        self.init()
        self.name = name
        self.category = category
        self.amount = amount
        self.date = date
    }
}
