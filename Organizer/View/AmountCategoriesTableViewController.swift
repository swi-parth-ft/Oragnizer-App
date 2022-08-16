//
//  AmountCategoriesTableViewController.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-29.
//

import UIKit
protocol AddFinanceCategory {
    func addFinanceCategory(data: String)
}
class AmountCategoriesTableViewController: UITableViewController {
    let categories: [String] = ["incoming payment","outgoing payment"]
    var delegate: AddFinanceCategory?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
                    cell = dequeueCell
                } else {
                    cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                }
        cell.textLabel?.text = categories[indexPath.row]
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.addFinanceCategory(data: categories[indexPath.row])
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
}
