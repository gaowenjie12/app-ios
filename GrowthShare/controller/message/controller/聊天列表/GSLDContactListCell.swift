//
//  GSLDContactListCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSLDContactListCell: UITableViewCell {
    private var imageV:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "meinv.jpg")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "刘波"
        
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "回来了吧"
        label.numberOfLines = 2
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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(44)
            make.height.equalTo(44)
            
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV)
            make.left.equalTo(self.imageV.snp.right).offset(10)
        }
        
        self.addSubview(self.contentLabel)
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(self.titleLabel)
        }
        
        self.addSubview(self.countLabel)
        self.countLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(15)
        }
        
        self.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right)
            make.right.bottom.equalTo(self.contentView)
            make.height.equalTo(1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model:GSMineSignModel? {
        didSet {
            guard let model = model else {return}
            // self.titleLabel.text = model.service_name
        }
    }
    
}



