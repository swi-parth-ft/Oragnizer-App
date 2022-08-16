//
//  TaskCell.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-24.
//
import UIKit

protocol CheckBox {
    func checkBox(state: Bool, index: Int?)
}

class TaskCell: UITableViewCell {
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if tasks![indexP!].checked {
            delegate?.checkBox(state: false, index: indexP)
        } else {
            delegate?.checkBox(state: true, index: indexP)
        }
    }
    
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var emojiLbl: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    var indexP: Int?
    var delegate: CheckBox?
    var tasks: [Tasks]?
}

