//
//  GSHallSection1CollectionCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/12.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHallSection3CollectionCell: UICollectionViewCell {
    
    private var bgView:UIView = {
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor.white
        bgView.layer.shadowColor = UIColor.init(white: 0, alpha: 0.1).cgColor
        bgView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        bgView.layer.shadowOpacity = 1
        bgView.layer.shadowRadius = 5
        bgView.layer.cornerRadius = 5

        return bgView
    }()
    
    private var imageView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "tuijian")
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "马化腾"
        return label
    }()
    private var moreBtn: UIButton = {
        let moreBtn = UIButton.init()
        moreBtn.setTitle("近期动态", for: .normal)
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        moreBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        moreBtn.titleLabel?.textAlignment = .center
        moreBtn.layer.cornerRadius = 3
        moreBtn.layer.masksToBounds = true
        moreBtn.layer.borderWidth = 1
        moreBtn.layer.borderColor = UIColor.cz_color(withHex: 0xAC9472)?.cgColor
        moreBtn.addTarget(self, action: #selector(moreBtnClick), for: .touchUpInside)
        return moreBtn
    }()
    @objc func moreBtnClick() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.bgView)
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(15)
            make.width.equalTo(78)
            make.height.equalTo(115)
            make.centerX.equalTo(self.contentView)
        }
        bgView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(bgView).offset(12)
            make.centerX.equalTo(bgView)
            make.height.width.equalTo(42)
        }
        
        bgView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
        }
        
        bgView.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView)
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
            make.width.equalTo(49)
            make.height.equalTo(18)
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
            self.titleLabel.text = dic["title"]
            self.imageView.image = UIImage.init(named: dic["image"] ?? "")
        }
    }
}
