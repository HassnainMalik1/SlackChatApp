//
//  RoundedButton.swift
//  Slack
//
//  Created by MalikHassnain on 13/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }


    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRadius
    }
    
    
    
}
