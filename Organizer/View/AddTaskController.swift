//
//  AddTaskController.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-24.
//
import UIKit

protocol AddTask {
    func addTask(name: String,category: String,emoji: String)
}

class AddTaskController: UIViewController,AddCategory {
    let myPicker: MyDatePicker = {
            let v = MyDatePicker()
            return v
        }()
    var emoji = ""
    @IBOutlet weak var happyEmoji: UIButton!
    @IBOutlet weak var loveEmoji: UIButton!
    @IBOutlet weak var winkEmoji: UIButton!
    @IBOutlet weak var sadEmoji: UIButton!
    @IBAction func happy(_ sender: Any) {
        emoji = "😁"
        happyEmoji.setBackgroundImage(UIImage(named: "selectedHolder"), for: .normal)
        loveEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        winkEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        sadEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
    }
    
    @IBAction func love(_ sender: Any) {
        emoji = "😍"
        happyEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        loveEmoji.setBackgroundImage(UIImage(named: "selectedHolder"), for: .normal)
        winkEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        sadEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
    }
    
    @IBAction func wink(_ sender: Any) {
        emoji = "😉"
        happyEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        loveEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        winkEmoji.setBackgroundImage(UIImage(named: "selectedHolder"), for: .normal)
        sadEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
    }

    @IBAction func sad(_ sender: Any) {
        emoji = "🙁"
        happyEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        loveEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        winkEmoji.setBackgroundImage(UIImage(named: "holder"), for: .normal)
        sadEmoji.setBackgroundImage(UIImage(named: "selectedHolder"), for: .normal)
    }
    
    @IBOutlet weak var selectDate: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var createReminderBtn: UIButton!
    @IBOutlet weak var selectTime: UIButton!
    @IBOutlet weak var categoryLbl: UIImageView!
    
    @IBOutlet weak var noteText: UITextField!
    @IBOutlet weak var noteLbl: UIImageView!
    @IBOutlet weak var nameLbl: UIImageView!
  
    @IBOutlet weak var detailsLbl: UIImageView!
    var category = ""
    
    private func animateFromLeft() {
        let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 400))
        containerView.backgroundColor = UIColor.white
        
        let offset = CGPoint(x: -containerView.frame.maxX, y: 0)
        let x: CGFloat = 0, y: CGFloat = 0
        nameLbl.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        nameLbl.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.nameLbl.transform = .identity
                self.nameLbl.alpha = 1
        })
        
        
        nameTextField.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        nameTextField.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.nameTextField.transform = .identity
                self.nameTextField.alpha = 1
        })
        
        detailsLbl.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        detailsLbl.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.detailsLbl.transform = .identity
                self.detailsLbl.alpha = 1
        })
        
        
        selectDate.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        selectDate.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.selectDate.transform = .identity
                self.selectDate.alpha = 1
        })
        
        selectTime.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        selectTime.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.selectTime.transform = .identity
                self.selectTime.alpha = 1
        })
    }
    
    private func amimateFromRight() {
        let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 400))
        containerView.backgroundColor = UIColor.white
        
        let offset = CGPoint(x: containerView.frame.maxX, y: 0)
        let x: CGFloat = 0, y: CGFloat = 0
        categoryLbl.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        categoryLbl.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.categoryLbl.transform = .identity
                self.categoryLbl.alpha = 1
        })
        
        
        categoryButton.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        categoryButton.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.categoryButton.transform = .identity
                self.categoryButton.alpha = 1
        })
        
        noteText.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        noteText.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.noteText.transform = .identity
                self.noteText.alpha = 1
        })
        
        
        noteLbl.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        noteLbl.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.noteLbl.transform = .identity
                self.noteLbl.alpha = 1
        })
    }
    
    private func animateBtn(){
        createReminderBtn.alpha = 0
        createReminderBtn.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 2, delay: 0.5, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.createReminderBtn.transform = .identity
                self.createReminderBtn.alpha = 1
        }, completion: nil)
    }
    
    func addcategory(data: String) {
        self.category = data
        print(category)
        categoryButton.setTitle(data, for: .normal)
    }
    
    
    @IBOutlet weak var categories: UIButton!
    
    @IBAction func addAction(_ sender: Any) {
        if nameTextField.text != "" {
            delegate?.addTask(name: nameTextField.text!,category: category,emoji: emoji)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [myPicker].forEach { v in
                    v.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview(v)
                }
                let g = view.safeAreaLayoutGuide
                NSLayoutConstraint.activate([
                    
                    // custom picker view should cover the whole view
                    myPicker.topAnchor.constraint(equalTo: g.topAnchor),
                    myPicker.leadingAnchor.constraint(equalTo: g.leadingAnchor),
                    myPicker.trailingAnchor.constraint(equalTo: g.trailingAnchor),
                    myPicker.bottomAnchor.constraint(equalTo: g.bottomAnchor),
                    
                    
                    
                ])
        myPicker.dPicker.datePickerMode = .date
               
                myPicker.isHidden = true
                myPicker.dismissClosure = { [weak self] in
                    guard let self = self else {
                        return
                    }
                    self.myPicker.isHidden = true
                }
                myPicker.changeClosure = { [weak self] val in
                    guard let self = self else {
                        return
                    }
                    print(val)
                }
        
        selectDate.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
    }
    @objc func tap(_ sender: Any) {
            myPicker.isHidden = false
        }
    @objc func dateChange(datePicker: UIDatePicker){
        
    }
    override func viewWillAppear(_ animated: Bool) {
        categoryButton.setTitle(category, for: .normal)
        animateBtn()
        animateFromLeft()
        amimateFromRight()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectCategory" {
            let categoriesVC = segue.destination as! CategoriesTableViewController
            categoriesVC.delegate = self
        }
    }
}

class MyDatePicker: UIView {
    
    var changeClosure: ((Date)->())?
    var dismissClosure: (()->())?

    let dPicker: UIDatePicker = {
        let v = UIDatePicker()
        return v
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func commonInit() -> Void {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)

        let pickerHolderView: UIView = {
            let v = UIView()
            v.backgroundColor = .white
            v.layer.cornerRadius = 8
            return v
        }()
        
        [blurredEffectView, pickerHolderView, dPicker].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }

        addSubview(blurredEffectView)
        pickerHolderView.addSubview(dPicker)
        addSubview(pickerHolderView)
        
        NSLayoutConstraint.activate([
            
            blurredEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurredEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurredEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurredEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),

            pickerHolderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            pickerHolderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            pickerHolderView.centerYAnchor.constraint(equalTo: centerYAnchor),

            dPicker.topAnchor.constraint(equalTo: pickerHolderView.topAnchor, constant: 20.0),
            dPicker.leadingAnchor.constraint(equalTo: pickerHolderView.leadingAnchor, constant: 20.0),
            dPicker.trailingAnchor.constraint(equalTo: pickerHolderView.trailingAnchor, constant: -20.0),
            dPicker.bottomAnchor.constraint(equalTo: pickerHolderView.bottomAnchor, constant: -20.0),

        ])
        
        if #available(iOS 14.0, *) {
            dPicker.preferredDatePickerStyle = .inline
        } else {
           
        }
        
        dPicker.addTarget(self, action: #selector(didChangeDate(_:)), for: .valueChanged)
        
        let t = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        blurredEffectView.addGestureRecognizer(t)
    }
    
    @objc func tapHandler(_ g: UITapGestureRecognizer) -> Void {
        dismissClosure?()
    }
    
    @objc func didChangeDate(_ sender: UIDatePicker) -> Void {
        changeClosure?(sender.date)
    }
    
}
