//
//  GSRZProjectDetailController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/16.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSRZProjectDetailController: GSBaseController {
    
    
    private lazy var top3View:UIView = {
        let top3View = UIView.init()
        top3View.backgroundColor = UIColor.white
        return top3View
    }()
    
    
    private lazy var configuration:SelPlayerConfiguration = {
        
        let configuration = SelPlayerConfiguration.init()
        
        configuration.shouldAutoPlay = false
        configuration.supportedDoubleTap = true
        configuration.shouldAutorotate = true
        configuration.repeatPlay = true
        configuration.statusBarHideState = SelStatusBarHideState.followControls
        // isStatusBarHideState
        // SelStatusBarHideStateFollowControls
        configuration.sourceUrl = URL.init(string: "https://vd2.bdstatic.com/mda-jb4kdg547pjrugai/sc/mda-jb4kdg547pjrugai.mp4?auth_key=1565769340-0-0-7e9ba6ee7a256c4a84fe8d05388cfaed&bcevod_channel=searchbox_feed&pd=bjh&abtest=all")
        configuration.videoGravity = SelVideoGravity.resizeAspect
        
        return configuration
    }()
    
    private lazy var player:SelVideoPlayer = {
        
        let player = SelVideoPlayer.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 180), configuration: self.configuration)
        
        return player!
    }()
    
    
    private var displayView: TLDisplayView = {
        let displayView = TLDisplayView.init()
        displayView.font = UIFont.systemFont(ofSize: 13)
        displayView.textColor = UIColor.cz_color(withHex: 0x222222)
        displayView.setText("智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。")
        displayView.numberOfLines = 6
        displayView.setOpen(" 详情", close: " 收起", font: UIFont.systemFont(ofSize: 13), textColor: UIColor.cz_color(withHex: 0xAC9472))
        
        displayView.backgroundColor = UIColor.white
        return displayView
    }()
    
    
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 180, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - GSNavBarHeight - 180))
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
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "智慧家居专家—— 一站式智能照明整体解决方案一站式智能照明整体解决方案一站式智能照明整体解决方案swift SnapKit高度自适应解决方案一站式智能照明整体解决方案一站式智能照明整体解决方案swift SnapKit高度自适应"
        label.numberOfLines = 2
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "北京智能科技有限公司"
        return label
    }()
    
    // 2.第二组
    // 3.第三组
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Int(UIDevice.current.systemVersion) ?? 0 > 7 {
            self.edgesForExtendedLayout = []
        }
        // 1. 添加视频播放器
        self.view.addSubview(self.player)
        
        
        // mark:添加滑动视图
        self.view.addSubview(self.scrollView)
        
        
        // 1.第一组
        
        scrollView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView).offset(15)
            make.left.equalTo(self.view).offset(12)
            make.right.equalTo(self.view).offset(-12)
        }
        
        scrollView.addSubview(self.subTitleLabel)
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        self.view.layoutIfNeeded()
        // 2.第二组
        self.scrollView.addSubview(self.displayView)
        self.displayView.delegate = self
        let size0 = displayView.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
        displayView.frame = CGRect.init(x: 12, y: subTitleLabel.frame.maxY + 10, width: size0.width, height: size0.height)
        
        // 添加底部视图
        let down2View = UIView.init()
        down2View.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        scrollView.addSubview(down2View)
        down2View.snp.makeConstraints { (make) in
            make.top.equalTo(displayView.snp.bottom).offset(10)
            make.left.right.equalTo(self.view)
            make.height.equalTo(10)
        }
        
        // 3.第三组
        scrollView.addSubview(top3View)
        top3View.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(down2View.snp.bottom)
            make.right.equalTo(self.view)
            make.height.equalTo(230)
        }
        
        let top3Label = UILabel.init()
        top3Label.text = "获取相关细聊"
        top3Label.textColor = UIColor.cz_color(withHex: 0x222222)
        top3Label.font = UIFont.systemFont(ofSize: 16)
        top3View.addSubview(top3Label)
        top3Label.snp.makeConstraints { (make) in
            make.top.equalTo(top3View).offset(20)
            make.left.equalTo(12)
        }
        
        
        let nameLabel = UILabel.init()
        nameLabel.text = "姓名"
        nameLabel.textColor = UIColor.cz_color(withHex: 0x979797)
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        top3View.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(top3Label.snp.bottom).offset(32)
            make.left.equalTo(top3Label)
        }

        let nameTF = UITextField.init()
        nameTF.textColor = UIColor.cz_color(withHex: 0x222222)
        nameTF.font = UIFont.systemFont(ofSize: 15)
        nameTF.layer.cornerRadius = 4
        nameTF.layer.masksToBounds = true
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.cz_color(withHex: 0xB6B6B6)?.cgColor
        top3View.addSubview(nameTF)
        nameTF.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.left.equalTo(nameLabel.snp.right).offset(20)
            make.right.equalTo(top3View).offset(-12)
            make.height.equalTo(39)
        }
        
        let iphoneLabel = UILabel.init()
        iphoneLabel.text = "手机"
        iphoneLabel.textColor = UIColor.cz_color(withHex: 0x979797)
        iphoneLabel.font = UIFont.systemFont(ofSize: 15)
        top3View.addSubview(iphoneLabel)
        iphoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(33)
            make.left.equalTo(nameLabel)
        }
        
        let iphoneTF = UITextField.init()
        iphoneTF.textColor = UIColor.cz_color(withHex: 0x222222)
        iphoneTF.font = UIFont.systemFont(ofSize: 15)
        iphoneTF.layer.cornerRadius = 4
        iphoneTF.layer.masksToBounds = true
        iphoneTF.layer.borderWidth = 1
        iphoneTF.layer.borderColor = UIColor.cz_color(withHex: 0xB6B6B6)?.cgColor
        top3View.addSubview(iphoneTF)
        iphoneTF.snp.makeConstraints { (make) in
            make.centerY.equalTo(iphoneLabel)
            make.left.equalTo(iphoneLabel.snp.right).offset(20)
            make.right.equalTo(top3View).offset(-12)
            make.height.equalTo(39)
        }
        
        
        let huodeBtn = UIButton.init()
        huodeBtn.setTitle("获取相关资料", for: .normal)
        huodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        huodeBtn.setTitleColor(UIColor.white, for: .normal)
        huodeBtn.backgroundColor = UIColor.cz_color(withHex: 0xAC9472)
        huodeBtn.layer.cornerRadius = 5
        huodeBtn.layer.masksToBounds = true
        top3View.addSubview(huodeBtn)
        huodeBtn.addTarget(self, action: #selector(huodeBtnClick), for: .touchUpInside)
        huodeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(iphoneTF.snp.bottom).offset(25)
            make.left.equalTo(top3View).offset(12)
            make.right.equalTo(top3View).offset(-12)
            make.height.equalTo(38)
        }
        
        self.view.layoutIfNeeded()
        print("\(top3View.frame.maxY)")
        
        scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 10)
        
       
    }
    
    @objc func huodeBtnClick(){
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.player._deallocPlayer()
    }
}

extension GSRZProjectDetailController:TLDisplayViewDelegate{
    func displayView(_ label: TLDisplayView!, openHeight height: CGFloat) {
        
        var frame = self.displayView.frame
        frame.size.height = height
        self.displayView.frame = frame
        
        self.view.layoutIfNeeded()
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 10)
        
    }
    
    func displayView(_ label: TLDisplayView!, closeHeight height: CGFloat) {
        
        var frame = self.displayView.frame
        frame.size.height = height
        self.displayView.frame = frame
        
        self.view.layoutIfNeeded()
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 10)
        
    }
}
