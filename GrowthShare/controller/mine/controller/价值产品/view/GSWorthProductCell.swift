//
//  GSWorthProductCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/9.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSWorthProductCell: UITableViewCell {
    
    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "meinv.jpg")
        imageV.layer.cornerRadius = 5
        imageV.layer.masksToBounds = true
        return imageV
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
        titleLabel.text = "农机设备出售"
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        subTitleLabel.text = "查看详情"
        return subTitleLabel
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
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
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        
        addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(12)
            make.width.equalTo(90)
            make.height.equalTo(57)
            make.centerY.equalTo(self.contentView)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageV.snp.right).offset(12)
            make.top.equalTo(imageV).offset(7)
        }
        addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(11)
        }
        self.addSubview(lookBtn)
        lookBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-12)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(22)
            make.width.equalTo(76)
        }
        self.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right)
            make.right.equalTo(self).offset(-13)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(1)
        }
    }
    func downCountAttributedleftString(label:UILabel,leftString:String,rightString:String) -> Void {
        let string = NSMutableAttributedString.init(string: leftString, attributes: [NSAttributedString.Key.foregroundColor:UIColor.cz_color(withHex: 0x222222) as Any,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)])
        let rightS = NSMutableAttributedString.init(string: rightString, attributes: [NSAttributedString.Key.foregroundColor:UIColor.cz_color(withHex: 0xF02D2D) as Any,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)])
        string.insert(rightS, at: leftString.count)
        label.attributedText = string
    }
    var model:GSMineSignModel? {
        didSet {
            guard let model = model else {return}
            //            self.titleLabel.text = model.service_name
        }
    }
    
}
