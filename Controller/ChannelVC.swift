//
//  ChannelVC.swift
//  Slack
//
//  Created by MalikHassnain on 08/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 80
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: GO_TO_LOGIN, sender: nil)
    }
    
}
