//
//  GSRZCollectionCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/16.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSRZCollectionCell: UICollectionViewCell {
    
    public var downView:UIView = {
        
        let downView = UIView()
        downView.backgroundColor = UIColor.white
        downView.layer.shadowColor = UIColor.cz_color(withRed: 10, green: 2, blue: 4)?.withAlphaComponent(0.14).cgColor
        downView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        downView.layer.shadowOpacity = 1
        downView.layer.shadowRadius = 5
        downView.layer.cornerRadius = 10
        return downView
    }()
    
    private var imageView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "meinv.jpg")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "智慧家居专家-一站式智能照明整体解决方案"
        label.numberOfLines = 2
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont.systemFont(ofSize: 10)
        subTitleLabel.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        subTitleLabel.text = "北京智能科技有限公司"
        subTitleLabel.numberOfLines = 2
        return subTitleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.downView)
        downView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }

        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(downView)
            make.height.equalTo(116)
        }

        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(downView).offset(10)
            make.right.equalTo(downView).offset(-10)
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
        }

        self.addSubview(self.subTitleLabel)
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel)
            make.right.equalTo(downView).offset(-10)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dic:[String:String]? {
        didSet {
            guard let dic = dic else {
                return
            }
//            self.titleLabel.text = dic["title"]
//            self.imageView.image = UIImage.init(named: dic["image"] ?? "")
        }
    }
}
