//
//  GSLDHXDetailSection1Cell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSLDHXDetailSection1Cell: UITableViewCell {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "只有自己知道，光鲜靓丽的背后付出了多少不被认知的辛苦，但是，所有的累，只能一笑而过。  你给上半年的自己打多少分？计划的书读了"
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(self.contentView).offset(12)
            make.right.equalTo(self.contentView).offset(-12)
            make.bottom.equalTo(-10)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    var dic:[String:String]? {
    //        didSet {
    //            guard let dic = dic else {
    //                return
    //            }
    //            self.titleLabel.text = dic["title"]
    //            self.imageView.image = UIImage.init(named: dic["image"] ?? "")
    //        }
    //    }
}
