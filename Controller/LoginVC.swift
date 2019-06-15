//
//  LoginVC.swift
//  Slack
//
//  Created by MalikHassnain on 08/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit
import SVProgressHUD
class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var userPasswordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
       SVProgressHUD.show()
       
        guard let email = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let pass = userPasswordTxt.text, userPasswordTxt.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        SVProgressHUD.dismiss()
                        debugPrint("username:\(UserDataService.instance.name)")
                        self.dismiss(animated: true, completion: nil)
                        
                    }
                })
            }
        }
    }
    
    @IBAction func closedPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: To_CREATE_ACCOUNT, sender: nil)
    }
    
    func setUpView(){
        
        usernameTxt.attributedPlaceholder = NSAttributedString (string: "username", attributes: [NSAttributedString.Key.foregroundColor: slackPurplePlaceHolder])
    
        userPasswordTxt.attributedPlaceholder = NSAttributedString (string: "password", attributes: [NSAttributedString.Key.foregroundColor: slackPurplePlaceHolder])
        
    
    }
}
