//
//  HomeViewController.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, CheckBox, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var toDoLabel: UIImageView!
    
    
    let button = UIButton()
    var tasks = [Tasks]()
    var workCount = 0
    var familyCount = 0
    var urgentCount = 0
    var imageArray = [UIImage(named: "workToDoImage"),UIImage(named: "familyToDoImage"),UIImage(named: "urgentToDoImage")]
  
    
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    private func animateCategoryView() {
        let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 400))
        containerView.backgroundColor = UIColor.white
        
        let offset = CGPoint(x: containerView.frame.maxX, y: 0)
        let x: CGFloat = 0, y: CGFloat = 0
        categoriesCollectionView.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        categoriesCollectionView.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.categoriesCollectionView.transform = .identity
                self.categoriesCollectionView.alpha = 1
        })
        
    }
    private func animateLabel() {
      let options: UIView.AnimationOptions = [.curveEaseInOut,
                                              .repeat,
                                              .autoreverse]


        UIView.animate(withDuration: 1.5,
                     delay: 0,
                     options: options,
                     animations: { [weak self] in
          self?.toDoLabel.frame.size.height *= 1.18
                      self?.toDoLabel.frame.size.width *= 1.18
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
        
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        categoriesCollectionView.alpha = 0
        categoriesCollectionView.reloadData()
        animateLabel()
        animateCategoryView()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return tasks.count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell

        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 52, height: 100))
        let image = UIImage(named: "toDoCell")
        imageView.image = image
        cell.backgroundView = UIImageView(image: imageView.image)
        
        
        cell.taskNameLabel.text = tasks[indexPath.row].name
        cell.categoryLabel?.text = tasks[indexPath.row].category
        cell.emojiLbl.text = tasks[indexPath.row].emoji
        if tasks[indexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "CheckedOrange"), for: UIControl.State.normal)
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: tasks[indexPath.row].name)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))

            cell.taskNameLabel.attributedText = attributeString
            if tasks[indexPath.row].category == "family"{
                familyCount -= 1
                categoriesCollectionView.reloadData()
            }
            if tasks[indexPath.row].category == "work"{
                workCount -= 1
                categoriesCollectionView.reloadData()
            }
            if tasks[indexPath.row].category == "urgent"{
                urgentCount -= 1
                categoriesCollectionView.reloadData()
            }

        } else {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "UncheckedOrange"), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.tasks = tasks
        cell.indexP = indexPath.row
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }

    func addTask(name: String, category: String,emoji: String) {
  
        if category == "family"{
            familyCount += 1
            print(familyCount)
        }
        if category == "work"{
            workCount += 1
        }
        if category == "urgent"{
            urgentCount += 1
        }
        
        tasks.append(Tasks(name: name,category: category,emoji: emoji))
     
        tableView.reloadData()
    }
    
    func checkBox(state: Bool, index: Int?) {
        tasks[index!].checked = state
        tableView.reloadRows(at: [IndexPath(row: index!, section: 0)], with: UITableView.RowAnimation.none)
    }
    
    @objc func toAddToDo(){
        performSegue(withIdentifier: "toAddToDo", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toDoCollectionViewCell", for: indexPath) as! toDoCollectionViewCell
        cell.categoryImage.image = imageArray[indexPath.row]
        if indexPath.row == 0{
        cell.count.text = "\(workCount)"
        }
        if indexPath.row == 1{
        cell.count.text = "\(familyCount)"
        }
        if indexPath.row == 2{
        cell.count.text = "\(urgentCount)"
        }
        return cell
    }
}


