//
//  GSMessageCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/12.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMessageCell: UITableViewCell {

    private var imageV:UIImageView = {
        
        let imageV = UIImageView()
        return imageV
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0x333333)
        return label
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.cz_color(withHex: 0xF02D2D)
        label.layer.cornerRadius = 7;
        label.layer.masksToBounds = true
        label.text = " 122 "
        return label
    }()
    
    private var lineView: UIView = {
        let lineView = UILabel()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return lineView
    }()
    lazy var lookBtn:UIButton = {
        
        let lookBtn = UIButton.init()
        lookBtn.setTitle("查看", for: .normal)
        lookBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        lookBtn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        lookBtn.layer.borderWidth = 1
        lookBtn.layer.borderColor = UIColor.cz_color(withHex: 0xAC9472).cgColor
        lookBtn.layer.cornerRadius = 9
        lookBtn.layer.masksToBounds = true
        return lookBtn
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        self.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.centerY.equalTo(self.contentView)
            make.height.width.equalTo(14)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(11)
            make.centerY.equalTo(self.contentView)
        }
        
        self.addSubview(self.countLabel)
        self.countLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(10)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(15)
        }
        
        self.addSubview(self.lookBtn)
        self.lookBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalTo(imageV)
            make.width.equalTo(34)
            make.height.equalTo(18)
        }
        
        self.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(1)
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
            self.titleLabel.text = dic["title"]
            if dic["title"] == "系统公告" || dic["title"] == "行业资讯"{
                self.countLabel.isHidden = true
            }else {
                self.countLabel.isHidden = false
            }
            self.imageV.image = UIImage.init(named: dic["image"] ?? "")
        }
    }
}
