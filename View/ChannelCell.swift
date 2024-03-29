//
//  ChannelCell.swift
//  Slack
//
//  Created by MalikHassnain on 15/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var channelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel : Channel){
        let title = channel.channelTitlte ?? ""
        channelName.text = "#\(title)"
    }

}
