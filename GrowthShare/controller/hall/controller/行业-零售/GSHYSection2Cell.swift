//
//  GSHYSection2Cell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/17.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHYSection2Cell: UITableViewCell {

    private var imageV:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "meinv.jpg")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "京东方科技集团股份有限公司"
        
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "京东方科技集团股份有限公司（BOE）创立于1993年4月，是一家为信息交互和人类健康..."
        label.numberOfLines = 2
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(90)
            make.height.equalTo(57)

        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV)
            make.left.equalTo(self.imageV.snp.right).offset(12)
            make.right.equalTo(-12)
        }
        
        self.addSubview(self.contentLabel)
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
            make.left.equalTo(self.titleLabel)
            make.right.equalTo(titleLabel)
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



