//
//  GSJiaZhiCPCollectionCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/16.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSJiaZhiCPCollectionCell: UICollectionViewCell {
    private var imageView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "meinv.jpg")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
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
            //            self.imageView.image = UIImage.init(named: dic["image"] ?? "")
        }
    }
}
