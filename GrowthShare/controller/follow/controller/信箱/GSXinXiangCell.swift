//
//  GSXinXiangCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/12.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSXinXiangCell: UITableViewCell {
    private var imageV:UIImageView = {
        
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "meinv.jpg")
        imageV.layer.cornerRadius = 22
        imageV.layer.masksToBounds = true
        return imageV
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0x333333)
        label.text = "恩师信箱"
        return label
    }()
    
    
    private var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF5F5F5)
        return lineView
    }()
    
    private var arrowImageV:UIImageView = {
        
        let arrowImageV = UIImageView()
        arrowImageV.image = UIImage.init(named: "youjiantou")
        return arrowImageV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        self.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.centerY.equalTo(self.contentView)
            make.height.width.equalTo(44)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(10)
            make.centerY.equalTo(self.contentView)
        }
        
        self.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right)
            make.bottom.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-6)
            make.height.equalTo(1)
        }
        
        self.addSubview(self.arrowImageV)
        self.arrowImageV.snp.makeConstraints { (make) in
            make.width.equalTo(7)
            make.height.equalTo(13)
            make.right.equalTo(self.contentView).offset(-12)
            make.centerY.equalTo(self.contentView)
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
