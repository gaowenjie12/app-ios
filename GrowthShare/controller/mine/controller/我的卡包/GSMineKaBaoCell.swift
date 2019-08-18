//
//  GSMineKaBaoCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMineKaBaoCell: UITableViewCell {

    lazy var downView: UIView = {
        let downView = UIView()
        downView.backgroundColor = UIColor.white
        downView.layer.cornerRadius = 5
        downView.layer.masksToBounds = true
        return downView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
        titleLabel.text = "产品推荐卷"
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        subTitleLabel.text = "使用条件：在一些情况下,除遵守本使用条件外,您还需要遵守额外的条款。您使用一项岸人工建筑的设计也需要..."
        subTitleLabel.numberOfLines = 2
        return subTitleLabel
    }()
    
    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "meinv.jpg")
        imageV.layer.cornerRadius = 11
        imageV.layer.masksToBounds = true
        return imageV
    }()
    
    lazy var companyLabel: UILabel = {
        let companyLabel = UILabel()
        companyLabel.font = UIFont.systemFont(ofSize: 10)
        companyLabel.textColor = UIColor.cz_color(withHex: 0x222222)
        companyLabel.text = "阿里巴巴集团"
        return companyLabel
    }()
    
    lazy var deleteBtn:UIButton = {
        
        let deleteBtn = UIButton.init()
        deleteBtn.setTitle("删除", for: .normal)
        deleteBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        deleteBtn.layer.cornerRadius = 11
        deleteBtn.layer.masksToBounds = true
        deleteBtn.layer.borderWidth = 1
        deleteBtn.layer.borderColor = UIColor.cz_color(withHex: 0xAC9472)?.cgColor
        return deleteBtn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.contentView.backgroundColor = UIColor.cz_color(withHex: 0xF2F2F2)

        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        self.addSubview(downView)
        downView.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(18)
        }
        
        
        downView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(downView).offset(24)
            make.top.equalTo(downView).offset(21)
        }
        
        
        
        downView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.right.equalTo(downView).offset(-15)

        }
        
        downView.addSubview(imageV)
        imageV.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.height.width.equalTo(22)
            make.bottom.equalTo(downView.snp.bottom).offset(-18)
        }
        
        
        downView.addSubview(companyLabel)
        companyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(8)
            make.centerY.equalTo(imageV)
        }
        
        downView.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (make) in
            make.right.equalTo(subTitleLabel)
            make.width.equalTo(42)
            make.centerY.equalTo(companyLabel)
        }
    }
    
    var model:GSMineSignModel? {
        didSet {
            guard let model = model else {return}
            //            self.titleLabel.text = model.service_name
        }
    }
    
}
