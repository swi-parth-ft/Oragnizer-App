//
//  ViewController.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-23.
//

import UIKit
import FBSDKLoginKit
class ViewController: UIViewController {
    var username:String = ""
    @IBOutlet var fbLoginBtn: UIButton!
    @IBOutlet weak var password: UIImageView!
    @IBOutlet weak var name: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var loginLabel: UIImageView!
    
    private func animateLoginLabel() {
        let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 400))
        containerView.backgroundColor = UIColor.white
        let offset = CGPoint(x: 0, y: -containerView.frame.maxY)
        let x: CGFloat = 0, y: CGFloat = 0
        loginLabel.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        loginLabel.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.loginLabel.transform = .identity
                self.loginLabel.alpha = 1
        })
        
        loginLabel.alpha = 0
        loginLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 2, delay: 1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.loginLabel.transform = .identity
                self.loginLabel.alpha = 1
        }, completion: nil)
        
        
        
    }
    
    private func animateBtn(){
        let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 400))
        containerView.backgroundColor = UIColor.white

        let offset = CGPoint(x: -containerView.frame.maxX, y: 0)
        let x: CGFloat = 0, y: CGFloat = 0
        fbLoginBtn.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        fbLoginBtn.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.fbLoginBtn.transform = .identity
                self.fbLoginBtn.alpha = 1
        })
    }
    
    private func animateUsername() {
        
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.nameField.transform = .identity
                self.nameField.alpha = 1
                self.name.transform = .identity
                self.name.alpha = 1
        }, completion: nil)
    }
    
    private func animatePassword() {
        
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.passwordField.transform = .identity
                self.passwordField.alpha = 1
                self.password.transform = .identity
                self.password.alpha = 1
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.alpha = 0
        password.alpha = 0
        nameField.alpha = 0
        passwordField.alpha = 0
        fbLoginBtn.alpha = 0
        fbLoginBtn.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        nameField.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        passwordField.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        name.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        password.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    
        fbLoginBtn.addTarget(self, action: #selector(fbLogin), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
       
        animateUsername()
        animatePassword()
        animateBtn()
        animateLoginLabel()
    }
    
    
    @objc func fbLogin(){
        print("eeee")
        LoginManager().logIn(permissions: ["public_profile", "email"], from: self) { [self] result, error in
            if error != nil{
                print("error")
            }

            GraphRequest(graphPath: "me", parameters: ["fields":"name, email"]).start { [self] connection, result, error in
                if let result = result as? [String:AnyObject] {
                    username = (result["name"] as? String)!
                    print("user: \(username)")
                    performSegue(withIdentifier: "tabSegue", sender: self)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MVC = segue.destination as? TabBarViewController
    }



        
    
}

