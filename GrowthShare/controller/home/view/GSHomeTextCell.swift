//
//  GSHomeTextCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/11.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHomeTextCell: UICollectionViewCell {
    
    let titleLabel:UILabel = {
        let titleLabel = UILabel.init()
        titleLabel.textColor = UIColor.cz_color(withHex: 0x555555)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.backgroundColor = UIColor.clear
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.top.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-2)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
