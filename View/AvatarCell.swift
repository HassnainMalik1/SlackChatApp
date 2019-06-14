//
//  AvatarCellCollectionViewCell.swift
//  Slack
//
//  Created by MalikHassnain on 14/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(index: Int, type: AvatarType)  {
        if type == AvatarType.dark {
            avatarImage.image  = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
            
            avatarImage.image  = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }

    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}


