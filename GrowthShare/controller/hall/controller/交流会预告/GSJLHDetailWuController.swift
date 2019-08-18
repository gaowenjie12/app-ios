//
//  GSJLHDetailWuController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSJLHDetailWuController: GSBaseController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "北京站|产品技术与行业应用交流会 产品经理必修课"
        label.numberOfLines = 2
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "发布时间：2019-07-07"
        return label
    }()
    

    private var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "meinv.jpg")
        return imageV
    }()
    
    
    private var daochangLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0xAC9472)
        label.text = "到场嘉宾："
        return label
    }()
    
    
    private var daochangZLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "杨东、玉红、刘辉、沈大海、徐继哲、吴波等"
        return label
    }()

    
    private var hTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0xAC9472)
        label.text = "活动时间："
        return label
    }()
    
    
    private var hTimeZLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "2019-07-07  16:00"
        return label
    }()
    
    
    private var hAddressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.cz_color(withHex: 0xAC9472)
        label.text = "活动地点："
        return label
    }()
    
    
    private var hAddressZLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "北京市丰台区丰台体育馆中心"
        return label
    }()
    
    
    private var downView: UIView = {
        let downView = UIView()
        downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return downView
    }()
    
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.cz_color(withHex: 0xAC9472)
        label.text = "活动详情"
        return label
    }()
    
    private var displayView: TLDisplayView = {
        let displayView = TLDisplayView.init()
        displayView.font = UIFont.systemFont(ofSize: 13)
        displayView.textColor = UIColor.cz_color(withHex: 0x222222)
        displayView.setText("智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。")
        displayView.numberOfLines = 6
        displayView.setOpen(" 详情", close: " 收起", font: UIFont.systemFont(ofSize: 13), textColor: UIColor.cz_color(withHex: 0xAC9472))
        
        displayView.backgroundColor = UIColor.white
        return displayView
    }()
    
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mark:添加滑动视图
        self.view.addSubview(self.scrollView)
        scrollView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView).offset(25)
            make.left.equalTo(self.view).offset(12)
            make.width.equalTo(UIScreen.cz_screenWidth() - 50)
        }
        
        scrollView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(19)
            make.left.equalTo(titleLabel)
        }
        
        scrollView.addSubview(imageV)
        imageV.snp.makeConstraints { (make) in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
            make.width.equalTo(UIScreen.cz_screenWidth() - 24)
            make.height.equalTo(205)
        }

        scrollView.addSubview(daochangLabel)
        daochangLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.bottom).offset(15)
            make.left.equalTo(titleLabel)
        }
        
        
        scrollView.addSubview(daochangZLabel)
        daochangZLabel.snp.makeConstraints { (make) in
            make.top.equalTo(daochangLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
        }
        
        
        scrollView.addSubview(hTimeLabel)
        hTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(daochangZLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
        }
        
        scrollView.addSubview(hTimeZLabel)
        hTimeZLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hTimeLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
        }
        
        
        scrollView.addSubview(hAddressLabel)
        hAddressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hTimeZLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
        }
        
        
        scrollView.addSubview(hAddressZLabel)
        hAddressZLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hAddressLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
        }
        
        scrollView.addSubview(downView)
        downView.snp.makeConstraints { (make) in
            make.top.equalTo(hAddressZLabel.snp.bottom).offset(20)
            make.left.equalTo(self.view)
            make.width.equalTo(UIScreen.cz_screenWidth())
            make.height.equalTo(10)
        }
        
        
        scrollView.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(downView.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
            
        }

        
        self.view.layoutIfNeeded()
        // 2.第二组
        scrollView.addSubview(self.displayView)
        self.displayView.delegate = self
        let size0 = displayView.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
        
        displayView.frame = CGRect.init(x: 12, y: detailLabel.frame.maxY + 10, width: size0.width, height: size0.height)
        
        self.view.layoutIfNeeded()
        scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: displayView.frame.maxY + 25)
        
        self.title = "活动详情"
        self.setupItems()
    }
    
    func setupItems() {
        
        
        let rightItem = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 17, height: 17))
        rightItem.setImage(UIImage.init(named: "shoucang_pre"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightItem)
        rightItem.addTarget(self, action: #selector(setupRightItem), for: .touchUpInside)
    }
    
    @objc func setupRightItem(){
        
    }
    
}

extension GSJLHDetailWuController:TLDisplayViewDelegate{
    func displayView(_ label: TLDisplayView!, openHeight height: CGFloat) {
        
        var frame = self.displayView.frame
        frame.size.height = height
        self.displayView.frame = frame
        
        self.view.layoutIfNeeded()
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: displayView.frame.maxY + 25)
        
    }
    
    func displayView(_ label: TLDisplayView!, closeHeight height: CGFloat) {
        
        var frame = self.displayView.frame
        frame.size.height = height
        self.displayView.frame = frame
        
        self.view.layoutIfNeeded()
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: displayView.frame.maxY + 25)
        
    }
}
