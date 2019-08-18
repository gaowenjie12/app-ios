//
//  GSMineSignDownCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/9.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMineSignDownCell: UITableViewCell {

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.white
        bgView.layer.shadowColor = UIColor.init(white: 0, alpha: 0.1).cgColor
        bgView.layer.shadowOffset = CGSize.init(width: 0, height: 0);
        bgView.layer.shadowOpacity = 1;
        bgView.layer.shadowRadius = 8;
        bgView.layer.cornerRadius = 5;
        return bgView
    }()
    
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
        titleLabel.text = "排名券"
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        subTitleLabel.text = "使用条件"
        return subTitleLabel
    }()

    lazy var shiyongBtn:UIButton = {
        
        let shiyongBtn = UIButton.init()
        shiyongBtn.setTitle("立即使用", for: .normal)
        shiyongBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        shiyongBtn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        shiyongBtn.layer.borderWidth = 1
        shiyongBtn.layer.borderColor = UIColor.cz_color(withHex: 0xAC9472)?.cgColor
        shiyongBtn.layer.cornerRadius = 11
        shiyongBtn.layer.masksToBounds = true
        return shiyongBtn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(81)
            make.top.equalTo(11)

        }
        
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(24)
            make.top.equalTo(bgView).offset(23)
        }
        
        bgView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
        
        bgView.addSubview(shiyongBtn)
        shiyongBtn.snp.makeConstraints { make in
            make.right.equalTo(bgView).offset(-23)
            make.centerY.equalTo(bgView)
            make.width.equalTo(59)
            make.height.equalTo(22)
        }
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var model:GSMineSignModel? {
        didSet {
            guard let model = model else {return}
            //            self.titleLabel.text = model.service_name
        }
    }
    
}
