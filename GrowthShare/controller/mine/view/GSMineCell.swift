//
//  GSMineCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/7.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMineCell: UICollectionViewCell {

    private var imageView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "kucunweihuo")
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "价值产品"
        return label
    }()
    
    
    private var rightView: UIView = {
        let rightView = UIView()
        rightView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return rightView
    }()
    
    private var downView: UIView = {
        let downView = UIView()
        downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return downView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayout() {
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(38)
            make.centerX.equalTo(self.contentView)
            make.height.width.equalTo(26)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(12)
        }
        
        self.addSubview(self.downView)
        self.downView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.right.equalToSuperview()

        }
        
        self.addSubview(self.rightView)
        self.rightView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(UIScreen.cz_screenWidth() / 3.0)
        }
        
        
        
    }
    var dic:[String:String]? {
        didSet {
            guard let dic = dic else {
                return
            }
            self.titleLabel.text = dic["title"]
            self.imageView.image = UIImage.init(named: dic["image"] ?? "")
        }
    }
}
