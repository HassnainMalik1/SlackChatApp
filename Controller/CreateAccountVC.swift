//
//  CreateAccountVC.swift
//  Slack
//
//  Created by MalikHassnain on 08/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    //variable
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
       performSegue(withIdentifier: UN_WIND_TO_CHANNEL, sender: nil)
    }
    
    @IBAction func ChooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func GenerateBackgroundColorPressed(_ sender: Any) {
    
    }
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
   
        guard let name = userNameText.text , userNameText.text != "" else { return }
        guard let email = userEmailText.text , userEmailText.text != "" else { return }
        guard let pass = userPassword.text , userPassword.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UN_WIND_TO_CHANNEL, sender: nil)
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
