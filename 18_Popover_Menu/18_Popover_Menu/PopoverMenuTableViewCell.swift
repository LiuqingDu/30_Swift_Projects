//
//  PopoverMenuTableViewCell.swift
//  18_Popover_Menu
//
//  Created by Liuqing Du on 2018/2/28.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

struct MenuItem {
    
    var picture: String!
    var name: String!
    
}

class PopoverMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuName: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
