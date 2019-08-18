//
//  GSMineSignCenterCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/9.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMineSignCenterCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
        titleLabel.numberOfLines = 0
        titleLabel.text = "连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券连续签到三天赠送排名券 连续签到五天赠送排名券"
        return titleLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview().offset(-13)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-15)
            
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
