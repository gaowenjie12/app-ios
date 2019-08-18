//
//  GSWorthProductCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/11.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSWorthProductTVCell: UITableViewCell {

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
        label.text = "奈雪的茶加盟-品牌全国连锁 加盟"
        label.numberOfLines = 2
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "7月4日 16:00 朝阳区"
        label.numberOfLines = 2
        return label
    }()
    
    private var lineView: UIView = {
        let lineView = UILabel()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return lineView
    }()
    lazy var lookBtn:UIButton = {
        
        let lookBtn = UIButton.init()
        lookBtn.setTitle("1268人看过", for: .normal)
        lookBtn.setTitleColor(GSFontColor, for: .normal)
        lookBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        lookBtn.layer.borderWidth = 1
        lookBtn.layer.borderColor = GSFontColor?.cgColor
        lookBtn.layer.cornerRadius = 5
        lookBtn.layer.masksToBounds = true
        return lookBtn
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        self.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.left.equalTo(13)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(95)
            make.width.equalTo(150)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV)
            make.left.equalTo(imageV.snp.right).offset(11)
            make.right.equalTo(self.contentView).offset(-9)
        }
        
        self.addSubview(self.subTitleLabel)
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
            make.right.equalTo(self.contentView).offset(-9)
        }
        
        self.addSubview(self.lookBtn)
        self.lookBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalTo(imageV)
            make.width.equalTo(76)
            make.height.equalTo(22)
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
