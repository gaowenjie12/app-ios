//
//  GSCaiGouKCController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/13.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSCaiGouKCController: GSBaseController {
    
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
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "产品关键词："
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "水杯"
        return label
    }()
    
    private var lookProjectBtn: UIButton = {
        let lookProjectBtn = UIButton()
        lookProjectBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        lookProjectBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        lookProjectBtn.setTitle("查看产品", for: .normal)
        lookProjectBtn.addTarget(self, action: #selector(lookProjectBtnClick), for: .touchUpInside)
        return lookProjectBtn
    }()
    
    // 2.第二组
    
    private var title2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "公司名称："
        return label
    }()
    
    private var subTitle2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "阿尔法科技公司"
        return label
    }()
    
    private var lookProject2Btn: UIButton = {
        let lookProjectBtn = UIButton()
        lookProjectBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        lookProjectBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        lookProjectBtn.setTitle("查看企业", for: .normal)
        lookProjectBtn.addTarget(self, action: #selector(lookProjectBtn2Click), for: .touchUpInside)

        return lookProjectBtn
    }()

    private var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控"
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mark:添加滑动视图
        self.view.addSubview(self.scrollView)
        self.title = "采购需求/库存情况"
        
        // 1.第一组
        
        scrollView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView).offset(25)
            make.left.equalTo(self.view).offset(12)
        }
        
        scrollView.addSubview(self.subTitleLabel)
        self.subTitleLabel.backgroundColor = UIColor.white
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        scrollView.addSubview(self.lookProjectBtn)
        self.lookProjectBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.right.equalTo(self.view).offset(-12)
        }
        let down1LineView = UIView.init()
        down1LineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        scrollView.addSubview(down1LineView)
        down1LineView.snp.makeConstraints { (make) in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(15)
            make.left.right.equalTo(self.view)
            make.height.equalTo(1)
        }


        // 2.第二组

        scrollView.addSubview(self.title2Label)
        self.title2Label.snp.makeConstraints { (make) in
            make.top.equalTo(down1LineView.snp.bottom).offset(15)
            make.left.equalTo(self.view).offset(12)
        }
        
        scrollView.addSubview(self.subTitle2Label)
        self.subTitle2Label.backgroundColor = UIColor.white
        self.subTitle2Label.snp.makeConstraints { (make) in
            make.top.equalTo(title2Label.snp.bottom).offset(15)
            make.left.equalTo(title2Label)
            make.top.equalTo(title2Label.snp.bottom).offset(10)
        }
        
        scrollView.addSubview(self.lookProject2Btn)
        self.lookProject2Btn.snp.makeConstraints { (make) in
            make.centerY.equalTo(title2Label)
            make.right.equalTo(self.view).offset(-12)
        }
        let down2View = UIView.init()
        down2View.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        scrollView.addSubview(down2View)
        down2View.snp.makeConstraints { (make) in
            make.top.equalTo(subTitle2Label.snp.bottom).offset(15)
            make.left.right.equalTo(self.view)
            make.height.equalTo(10)
        }
        scrollView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(down2View.snp.bottom).offset(20)
            make.left.equalTo(12)
            make.width.equalTo(UIScreen.cz_screenWidth() - 24)
        }
        
        self.view.layoutIfNeeded()

        scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: contentLabel.frame.maxY + 30)
        
        
    }
    
    @objc func lookProjectBtnClick(){
        self.navigationController?.pushViewController(GSJiaZhiCPDetailController.init(), animated: true)
    }
    @objc func lookProjectBtn2Click(){
        self.navigationController?.pushViewController(GSCompanyJJController.init(), animated: true)

    }
}

