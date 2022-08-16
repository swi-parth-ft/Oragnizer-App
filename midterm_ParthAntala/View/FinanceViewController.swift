//
//  FinanceViewController.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-23.
//

import UIKit

class FinanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddAmount {
    let button = UIButton()
    var transaction = [Transaction]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tracker: UISlider!
    @IBOutlet weak var remainingAmount: UILabel!
    var rAmount = 1000
    @IBOutlet weak var card: UIImageView!
    @IBOutlet weak var defaultCardLabel: UILabel!
    @IBOutlet weak var moneyLabel: UIImageView!
    
    
    
    private func animateLabel() {
      let options: UIView.AnimationOptions = [.curveEaseInOut,
                                              .repeat,
                                              .autoreverse]


        UIView.animate(withDuration: 1.5,
                     delay: 0,
                     options: options,
                     animations: { [weak self] in
          self?.moneyLabel.frame.size.height *= 1.18
                      self?.moneyLabel.frame.size.width *= 1.18
      }, completion: nil)
    }

    private func animateCard() {
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseInOut, animations: {
            self.card.transform = CGAffineTransform(scaleX: -1, y: 1)
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseInOut, animations: {
            self.card.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        
        
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "addToDo"), for: .normal)
        self.view.addSubview(button)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = .none
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.topAnchor, multiplier: 80).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
        button.addTarget(self, action: #selector(toAddToDo), for: .touchUpInside)
        tracker.setThumbImage(UIImage(), for: .normal)
        
        remainingAmount.text = "+ $1000"
        tracker.value = 1000
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        animateLabel()
        animateCard()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "financeCell", for: indexPath) as! FinanceTableViewCell
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 52, height: 100))
        let image = UIImage(named: "toDoCell")
        imageView.image = image
        cell.backgroundView = UIImageView(image: imageView.image)
        
        cell.name.text = transaction[indexPath.row].name
        cell.amount.text = "$" + String(transaction[indexPath.row].amount)
        if transaction[indexPath.row].category == "incoming payment"{
            let image = UIImage(named: "incomeLogo")
            cell.typeLogo.image = image
            cell.details.text = "incoming payment | \(String(describing: transaction[indexPath.row].date!))"
            
        } else {
            let image = UIImage(named: "outgoingLogo")
            cell.typeLogo.image = image
            cell.details.text = "outgoing payment | \(String(describing: transaction[indexPath.row].date!))"
            
        }
        return cell
        
    }
    
    func addAmount(name: String, category: String, amount: Int, date: Date) {
        transaction.append(Transaction(name: name,category: category,amount: amount,date: date))
        if category == "incoming payment"{
            rAmount += amount
            remainingAmount.text = "+ $\(rAmount)"
            tracker.value = Float(rAmount)
        } else {
            rAmount -= amount
            print(rAmount)
            remainingAmount.text = "+ $\(rAmount)"
            tracker.value = Float(rAmount)
        }
        tableView.reloadData()
    }
    
    @objc func toAddToDo(){
        performSegue(withIdentifier: "toAddTransaction", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! NewAmountViewController
        vc.delegate = self
    }

 

}

