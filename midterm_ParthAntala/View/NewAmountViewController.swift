//
//  NewAmountViewController.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-29.
//

import UIKit
protocol AddAmount {
    func addAmount(name: String,category: String, amount: Int, date: Date)
}
class NewAmountViewController: UIViewController, AddFinanceCategory{
    let myPicker: MyDatePicker = {
            let v = MyDatePicker()
            return v
        }()
    var date: Date?
    @IBOutlet weak var detailsLbl: UIImageView!
    @IBOutlet weak var selectAmount: UIImageView!
    @IBOutlet weak var amountHead: UIImageView!
    @IBOutlet weak var amountBorder: UIImageView!
    @IBOutlet weak var categoryLbl: UIImageView!
    @IBOutlet weak var nameLbl: UIImageView!
    @IBOutlet weak var datePicker: UIButton!
    @IBOutlet weak var selectDate: UIButton!
    @IBOutlet weak var categoryButton: UIButton!
    var amount = 250
    @IBAction func amountSlider(_ sender: UISlider) {
        amountLbl.text = "$" + String(Int(sender.value))
        amount = Int(sender.value)
    }
    @IBOutlet weak var amountSlider: UISlider!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var enterNewAmountButton: UIButton!
    @IBOutlet weak var amountName: UITextField!
    @IBOutlet weak var newAmountBtn: UIButton!
    var category = ""
    
    private func animateFromLeft() {
        let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 400))
        containerView.backgroundColor = UIColor.white
        
        let offset = CGPoint(x: -containerView.frame.maxX, y: 0)
        let x: CGFloat = 0, y: CGFloat = 0
        categoryButton.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        categoryButton.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.categoryButton.transform = .identity
                self.categoryButton.alpha = 1
        })
        
        
        categoryLbl.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        categoryLbl.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.categoryLbl.transform = .identity
                self.categoryLbl.alpha = 1
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
        
        datePicker.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        datePicker.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.datePicker.transform = .identity
                self.datePicker.alpha = 1
        })
    }
    
    private func amimateFromRight() {
        let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 400))
        containerView.backgroundColor = UIColor.white
        
        let offset = CGPoint(x: containerView.frame.maxX, y: 0)
        let x: CGFloat = 0, y: CGFloat = 0
        amountName.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        amountName.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.amountName.transform = .identity
                self.amountName.alpha = 1
        })
        
        
        amountLbl.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        amountLbl.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.amountLbl.transform = .identity
                self.amountLbl.alpha = 1
        })
        
        nameLbl.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        nameLbl.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.nameLbl.transform = .identity
                self.nameLbl.alpha = 1
        })
        
        
        amountSlider.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        amountSlider.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.amountSlider.transform = .identity
                self.amountSlider.alpha = 1
        })
        
        selectAmount.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        selectAmount.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.selectAmount.transform = .identity
                self.selectAmount.alpha = 1
        })
        
        amountBorder.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        amountBorder.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.amountBorder.transform = .identity
                self.amountBorder.alpha = 1
        })
        
        amountHead.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        amountHead.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.amountHead.transform = .identity
                self.amountHead.alpha = 1
        })
    }
    
    func addFinanceCategory(data: String) {
        self.category = data
        print(category)
        categoryButton.setTitle(data, for: .normal)
    }
    private func animateBtn(){
        newAmountBtn.alpha = 0
        newAmountBtn.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 2, delay: 0.5, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.newAmountBtn.transform = .identity
                self.newAmountBtn.alpha = 1
        }, completion: nil)
    }
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
                    self.date = val
                }
        
                
        datePicker.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        
    }
    
    var delegate: AddAmount?
    @IBAction func enterNewAmountClicked(_ sender: Any) {
        if amountName.text != "" {
            delegate?.addAmount(name: amountName.text!,category: category, amount: amount, date: date!)
            navigationController?.popViewController(animated: true)
        }
    }
    @objc func tap(_ sender: Any) {
            myPicker.isHidden = false
        }
   
        
    override func viewWillAppear(_ animated: Bool) {
        enterNewAmountButton.setTitle(category, for: .normal)
        animateBtn()
        animateFromLeft()
        amimateFromRight()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectAmountType" {
            let categoriesVC = segue.destination as! AmountCategoriesTableViewController
            categoriesVC.delegate = self
        }
    }
}
    class MyDatePicker1: UIView {
        
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

   


