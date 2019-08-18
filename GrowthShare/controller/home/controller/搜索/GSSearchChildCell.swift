//
//  GSSearchChildCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/13.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSSearchChildCell: UICollectionViewCell {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.layer.cornerRadius = 14
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.cz_color(withHex: 0xDADADA)?.cgColor
        label.layer.borderWidth = 1
        label.text = "   培训班   "
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.contentView)
            make.height.equalTo(28)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dic:[String:String]? {
        didSet {
            guard let dic = dic else {
                return
            }
//            self.titleLabel.text = dic["title"]
        }
    }
}
