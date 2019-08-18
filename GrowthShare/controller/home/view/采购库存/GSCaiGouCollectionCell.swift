//
//  GSCaiGouCollectionCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/11.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSCaiGouCollectionCell: UICollectionViewCell {
    private var imageView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "meinv.jpg")
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0x555555)
        label.text = "价值产品"
        return label
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.contentView.backgroundColor = UIColor.white
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(10)
            make.centerX.equalTo(self.contentView)
            make.height.width.equalTo(87)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(12)
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
