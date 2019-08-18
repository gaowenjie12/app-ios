//
//  GSCaiGouCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSCaiGouCell: UITableViewCell {

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
        subTitleLabel.text = "简介"
        return subTitleLabel
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return lineView
    }()
    lazy var deleteBtn:UIButton = {
        
        let deleteBtn = UIButton.init()
        deleteBtn.setTitle("删除", for: .normal)
        deleteBtn.setTitleColor(UIColor.cz_color(withHex: 0xF02D2D), for: .normal)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return deleteBtn
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
        
 
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(self.contentView).offset(10)
        }
        
        self.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-12)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.centerY.equalTo(deleteBtn)
        }
        
        self.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
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
