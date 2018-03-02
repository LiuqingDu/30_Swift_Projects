//
//  CustomCollectionViewCell.swift
//  20_Custom_Transition
//
//  Created by Liuqing Du on 2018/3/2.
//  Copyright © 2018年 JuneDesign. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configCell(model:CustomCollectionViewCellModel) {
        imageView = UIImageView(frame: self.bounds)
        imageView.image = model.image
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
