//
//  GSHelpCenterCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHelpCenterCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
        titleLabel.text = "标题"
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 15)
        subTitleLabel.textColor = UIColor.cz_color(withHex: 0xDADADA)
        subTitleLabel.text = "07-10"
        return subTitleLabel
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return lineView
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
        
        
        addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.right.equalTo(-12)
            make.centerY.equalTo(self.contentView)
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
