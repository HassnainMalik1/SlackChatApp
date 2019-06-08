 //
//  GradientView.swift
//  Slack
//
//  Created by MalikHassnain on 08/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit

 @IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1){
        didSet{
             self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1){
        didSet{
            self.setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        let graidentLayer = CAGradientLayer()
        
        graidentLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        graidentLayer.startPoint = CGPoint(x: 0, y: 0.5)
        graidentLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        graidentLayer.frame  = self.bounds
        
        self.layer.insertSublayer(graidentLayer, at: 0)
    }
    
    
}
