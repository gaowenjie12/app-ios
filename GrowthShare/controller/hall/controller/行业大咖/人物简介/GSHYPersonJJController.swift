//
//  GSHYPersonJJController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHYPersonJJController: GSBaseController {

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - GSNavBarHeight))
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = UIColor.white
        scrollView.isScrollEnabled = true
        return scrollView
    }()
   
    // 1.第一组
    
    private var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "meinv.jpg")
        imageV.layer.cornerRadius = 35
        imageV.layer.masksToBounds = true
        return imageV
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "孙正义"
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "国际知名投资人"
        return label
    }()
    
    
    private var jianjieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "简介"
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "孙正义（そんまさよし）其本贯为一支孙氏（朝鲜语：일직 손씨）。1957年生于日本，国际知名投资人。软件银行集团董事长兼总裁。 孙正义（そんまさよし）其本贯为一支孙氏（朝鲜语：일직 손씨）。1957年生于日本，国际知名投资人。软件银行集团董事长兼总裁。 孙正义（そんまさよし）其本贯为一支孙氏（朝鲜语：일직 손씨）。1957年生于日本，国际知名投资人。软件银行集团董事长兼总裁。 孙正义（そんまさよし）其本贯为一支孙氏（朝鲜语：일직 손씨）。1957年生于日本，国际知名投资人。软件银行集团董事长兼总裁。 "
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mark:添加滑动视图
        self.view.addSubview(self.scrollView)
        self.title = "人物简介"
        
        // 1.第一组
        
        scrollView.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView).offset(36)
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(70)
        }
        
        scrollView.addSubview(self.titleLabel)
        self.titleLabel.backgroundColor = UIColor.white
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.bottom).offset(16)
            make.centerX.equalTo(self.view)
        }
        
        scrollView.addSubview(self.subTitleLabel)
        self.subTitleLabel.backgroundColor = UIColor.white
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
        }

        // 添加底部视图
        let downView = UIView.init()
        downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        scrollView.addSubview(downView)
        downView.snp.makeConstraints { (make) in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(35)
            make.left.equalTo(self.view)
            make.width.equalTo(UIScreen.cz_screenWidth())
            make.height.equalTo(10)
        }
        
        scrollView.addSubview(self.jianjieLabel)
        self.jianjieLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(12)
            make.top.equalTo(downView.snp.bottom).offset(20)
        }
        
        scrollView.addSubview(self.contentLabel)
        self.contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(jianjieLabel)
            make.width.equalTo(UIScreen.cz_screenWidth() - 24)
            make.top.equalTo(jianjieLabel.snp.bottom).offset(20)
        }

        
       
        
        self.view.layoutIfNeeded()
        scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: contentLabel.frame.maxY + 20)
        
    }
    
}

