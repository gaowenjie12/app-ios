//
//  GSHallSection4Cell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/12.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHallSection4Cell: UITableViewCell {

    private var imageV:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "meinv.jpg")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    public var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0xAC9472)
        label.text = "交流会分类"
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.cz_color(withHex: 0xAC9472)?.cgColor
        label.layer.borderWidth = 1
        label.textAlignment = .center
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(5)
            make.left.equalTo(self.contentView).offset(12)
            make.right.equalTo(self.contentView).offset(-12)
            make.bottom.equalTo(-10)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(imageV)
            make.right.equalTo(self.imageV).offset(-57)
            make.width.equalTo(100)
            make.height.equalTo(30)
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



