//
//  AddChannelVC.swift
//  Slack
//
//  Created by MalikHassnain on 16/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var channelDescTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        
    }


    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxtField.text , nameTxtField.text != "" else {return}
        guard let channelDesc = channelDescTxtField.text else {return}
        SocketService.instance.addChannel(channelName: channelName, channelDesc: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setUpView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap(_:)))
        
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxtField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : slackPurplePlaceHolder])
        
          channelDescTxtField.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : slackPurplePlaceHolder])
    }
    
    @objc func  closeTap(_ recoginzer : UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
