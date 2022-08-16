//
//  WeeklyViewController.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-07-08.
//

import UIKit

var selectedDate = Date()

class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
                            UITableViewDelegate, UITableViewDataSource
{
    let button = UIButton()
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    

    var totalSquares = [Date]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setCellsView()
        setWeekView()
        self.tableView.separatorStyle = .none
        
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "addToDo"), for: .normal)
        self.view.addSubview(button)
        
       
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.topAnchor, multiplier: 80).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
        button.addTarget(self, action: #selector(toCreateEvent), for: .touchUpInside)
    }
    @objc func toCreateEvent(){
        performSegue(withIdentifier: "toCreateEvent", sender: self)
    }
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2)
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setWeekView()
    {
        totalSquares.removeAll()
        
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)
            + " " + CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
        tableView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        
        let date = totalSquares[indexPath.item]
        cell.dayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))
        
        if(date == selectedDate)
        {
            cell.backgroundColor = UIColor.orange
            cell.dayOfMonth.textColor = UIColor.white
            cell.layer.cornerRadius = 10
        }
        else
        {
            
            cell.backgroundColor = UIColor.white
            cell.dayOfMonth.textColor = UIColor.black
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedDate = totalSquares[indexPath.item]
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    @IBAction func previousWeek(_ sender: Any)
    {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
    
    @IBAction func nextWeek(_ sender: Any)
    {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    
    override open var shouldAutorotate: Bool
    {
        return false
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Event().eventsForDate(date: selectedDate).count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! EventCell
        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]
        cell.eventLabel.text = event.name
        cell.timeLabel.text = CalendarHelper().timeString(date: event.date)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 52, height: 100))
        let image = UIImage(named: "toDoCell")
        imageView.image = image
        cell.backgroundView = UIImageView(image: imageView.image)
        
        if event.color == "blue"{
            cell.eventColor.image = UIImage(named: "blueBall")
        }
        if event.color == "pink"{
            cell.eventColor.image = UIImage(named: "pinkBall")
        }
        if event.color == "orange"{
            cell.eventColor.image = UIImage(named: "orangeBall")
        }
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}

