//
//  GSMineSignTopCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/9.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMineSignTopCell: UITableViewCell {

    
    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "rili")
        return imageV
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
        titleLabel.text = "您已累计签到 2天"
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        subTitleLabel.text = "再签到一天可领取排名卷"
        return subTitleLabel
    }()
    
    lazy var signBtn:UIButton = {
        
        let signBtn = UIButton.init()
        signBtn.setTitle("签到", for: .normal)
        signBtn.setTitleColor(GSFontColor, for: .normal)
        signBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signBtn.layer.borderWidth = 1
        signBtn.layer.borderColor = GSFontColor?.cgColor
        signBtn.layer.cornerRadius = 5
        signBtn.layer.masksToBounds = true
        return signBtn
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
            make.left.equalTo(self.contentView).offset(33)
            make.height.width.equalTo(39)
            make.centerY.equalTo(self.contentView)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageV.snp.right).offset(16)
            make.top.equalTo(imageV)
        }
        self.downCountAttributedleftString(label: titleLabel, leftString: "您已累计签到", rightString: " 2天")
        addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageV.snp.right).offset(16)
            make.bottom.equalTo(imageV)
        }
        self.addSubview(signBtn)
        signBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-27)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(32)
            make.width.equalTo(60)
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
