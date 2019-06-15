//
//  CreateAccountVC.swift
//  Slack
//
//  Created by MalikHassnain on 08/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit
import SVProgressHUD
class CreateAccountVC: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    //variable
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("dark") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
       performSegue(withIdentifier: UN_WIND_TO_CHANNEL, sender: nil)
    }
    
    @IBAction func ChooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func GenerateBackgroundColorPressed(_ sender: Any) {
    
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.3){
            self.userImage.backgroundColor = self.bgColor
        }
    }
    
    func setUpView(){
        spinner.isHidden = true
        
        userNameText.attributedPlaceholder = NSAttributedString (string: "Username", attributes: [NSAttributedString.Key.foregroundColor: slackPurplePlaceHolder])
    
          userEmailText.attributedPlaceholder = NSAttributedString (string: "UserEmail", attributes: [NSAttributedString.Key.foregroundColor: slackPurplePlaceHolder])
        
          userPassword.attributedPlaceholder = NSAttributedString (string: "UserPassword", attributes: [NSAttributedString.Key.foregroundColor: slackPurplePlaceHolder])
        
        let tap  = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        self.view.endEditing(true)
    }
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        SVProgressHUD.show()
        
        guard let name = userNameText.text , userNameText.text != "" else { return }
        guard let email = userEmailText.text , userEmailText.text != "" else { return }
        guard let pass = userPassword.text , userPassword.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                
                                self.performSegue(withIdentifier: UN_WIND_TO_CHANNEL, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                                SVProgressHUD.dismiss()
                            }else{
                                debugPrint("Error")
                            }
                        })
                    }
                })
            }
        }
        
    }
    
}
