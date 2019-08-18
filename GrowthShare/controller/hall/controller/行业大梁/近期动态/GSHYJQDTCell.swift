//
//  GSHYJQDTCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHYJQDTCell: UITableViewCell {
    private var imageV:UIImageView = {
        
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "meinv.jpg")
        imageV.layer.cornerRadius = 5
        imageV.layer.masksToBounds = true
        return imageV
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "为何马云仅有7%的股份就控制了阿里,孙正义是最大股东却说了不算"
        label.numberOfLines = 2
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "发布时间：2019-07-07"
        label.numberOfLines = 2
        return label
    }()
    
   
    private var lineView: UIView = {
        let lineView = UILabel()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return lineView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        self.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(90)
            make.width.equalTo(90)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV)
            make.left.equalTo(self.contentView).offset(12)
            make.right.equalTo(imageV.snp.left).offset(-23)
        }
        
        self.addSubview(self.subTitleLabel)
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(imageV)
            make.left.right.equalTo(titleLabel)
        }
        
        self.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(1)
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
