//
//  GSJLHFenLeiLeftCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSJLHFenLeiLeftCell: UITableViewCell {


    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.cz_color(withHex: 0x15325E)
        label.text = "IT/通信/互联网"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.contentView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)

        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(12)
            make.right.equalTo(-12)

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
