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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closePressed(_ sender: Any) {
       performSegue(withIdentifier: UN_WIND_TO_CHANNEL, sender: nil)
    }
    
    @IBAction func ChooseAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func GenerateBackgroundColorPressed(_ sender: Any) {
    
    }
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
   
        guard let email = userEmailText.text ,  userEmailText.text != "" else {
            return
        }
        guard let pass = userPassword.text,  userPassword.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("registered user")
            }
        }
        
    }
    
}
