//
//  EventEditViewController.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-07-08.
//

import UIKit

class EventEditViewController: UIViewController
{
    var color: String?
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        datePicker.date = selectedDate
    }
    
    @IBAction func saveAction(_ sender: Any)
    {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTF.text
        newEvent.date = datePicker.date
        newEvent.color = color
        eventsList.append(newEvent)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func blueBall(_ sender: Any) {
        color = "blue"
    }
    
    @IBAction func orangeBall(_ sender: Any) {
        color = "orange"
    }
    
    @IBAction func pinkBall(_ sender: Any) {
        color = "pink"
    }
    
}
