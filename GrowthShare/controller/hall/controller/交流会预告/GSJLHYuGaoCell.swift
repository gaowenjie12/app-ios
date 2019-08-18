//
//  GSJLHYuGaoCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSJLHYuGaoCell: UITableViewCell {

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
        label.text = "【北京站】合伙人股权分配、 股权激励、顶层设计、股..."
        label.numberOfLines = 2
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "到场嘉宾：杨东、玉红、刘辉..."
        return label
    }()
    
    private var lineView: UIView = {
        let lineView = UILabel()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return lineView
    }()
    
    
    lazy var shoucangBtn:UIButton = {
        
        let shoucangBtn = UIButton.init()
        shoucangBtn.setImage(UIImage.init(named: "shoucang_pre"), for: .normal)
        return shoucangBtn
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "7月4日 16:00 朝阳区"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        self.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(95)
            make.width.equalTo(150)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV)
            make.left.equalTo(imageV.snp.right).offset(12)
            make.right.equalTo(self.contentView).offset(-12)
        }
        
        self.addSubview(self.subTitleLabel)
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
            make.right.equalTo(-12)
        }
        
        self.addSubview(self.shoucangBtn)
        self.shoucangBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.height.equalTo(16)
            make.width.equalTo(17)
            make.bottom.equalTo(self.imageV)
        }
        
        self.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.imageV)
            make.left.equalTo(titleLabel)
            make.right.equalTo(shoucangBtn.snp.right).offset(-20)
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
