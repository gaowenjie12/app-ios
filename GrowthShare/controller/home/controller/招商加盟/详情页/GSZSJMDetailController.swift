//
//  GSZSJMDetailController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/13.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSZSJMDetailController: GSBaseController {
    
    private lazy var top3ImageView:UIImageView = {
        let top3ImageView = UIImageView.init()
        top3ImageView.image = UIImage.init(named: "meinv.jpg")
        top3ImageView.layer.cornerRadius = 10
        top3ImageView.layer.masksToBounds = true
        return top3ImageView
    }()
    private lazy var top4View:UIView = {
        let top4View = UIView.init()
        top4View.backgroundColor = UIColor.white
        return top4View
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
    
    
    private var displayView1: TLDisplayView = {
        let displayView1 = TLDisplayView.init()
        displayView1.font = UIFont.systemFont(ofSize: 13)
        displayView1.textColor = UIColor.cz_color(withHex: 0x222222)
        displayView1.setText("智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。")
        displayView1.numberOfLines = 6
        displayView1.setOpen(" 详情", close: " 收起", font: UIFont.systemFont(ofSize: 13), textColor: UIColor.cz_color(withHex: 0xAC9472))
        
        displayView1.backgroundColor = UIColor.white
        return displayView1
    }()
    
    private var displayView2: TLDisplayView = {
        let displayView2 = TLDisplayView.init()
        displayView2.font = UIFont.systemFont(ofSize: 13)
        displayView2.textColor = UIColor.cz_color(withHex: 0x222222)
        displayView2.setText("智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。")
        displayView2.numberOfLines = 6
        displayView2.setOpen(" 详情", close: " 收起", font: UIFont.systemFont(ofSize: 13), textColor: UIColor.cz_color(withHex: 0xAC9472))
        
        displayView2.backgroundColor = UIColor.white
        return displayView2
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
    // 4.第四组
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
        let top3View = UIView.init()
        top3View.backgroundColor = UIColor.white
        scrollView.addSubview(top3View)
        top3View.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(down2View.snp.bottom)
            make.right.equalTo(self.view)
            make.height.equalTo(40)
        }
        
        let top3Label = UILabel.init()
        top3Label.text = "企业简介"
        top3Label.textColor = UIColor.cz_color(withHex: 0x222222)
        top3Label.font = UIFont.systemFont(ofSize: 16)
        top3View.addSubview(top3Label)
        top3Label.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(12)
            make.centerY.equalTo(top3View)
        }
        
        let top3Btn = UIButton.init()
        top3Btn.setTitle("查看企业", for: .normal)
        top3Btn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        top3Btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        top3View.addSubview(top3Btn)
        top3Btn.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-12)
            make.centerY.equalTo(top3View)
        }
        
        scrollView.addSubview(top3ImageView)
        top3ImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(12)
            make.right.equalTo(self.view).offset(-12)
            make.top.equalTo(top3View.snp.bottom)
            make.height.equalTo(180)
        }
        self.view.layoutIfNeeded()
        print("\(top3ImageView.frame.maxY)")

        self.scrollView.addSubview(self.displayView1)
        self.displayView1.delegate = self
        let size = displayView1.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
        displayView1.frame = CGRect.init(x: 12, y: top3ImageView.frame.maxY + 10, width: size.width, height: size.height)
        
        
        // 添加底部视图
        let down3View = UIView.init()
        down3View.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        scrollView.addSubview(down3View)
        down3View.snp.makeConstraints { (make) in
            make.top.equalTo(displayView1.snp.bottom).offset(10)
            make.left.right.equalTo(self.view)
            make.height.equalTo(10)
        }
        
        // 4.第三组
        scrollView.addSubview(top4View)
        top4View.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(down3View.snp.bottom)
            make.right.equalTo(self.view)
            make.height.equalTo(40)
        }

        let top4Label = UILabel.init()
        top4Label.text = "政策说明"
        top4Label.textColor = UIColor.cz_color(withHex: 0x222222)
        top4Label.font = UIFont.systemFont(ofSize: 16)
        top4View.addSubview(top4Label)
        top4Label.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(12)
            make.centerY.equalTo(top4View)
        }

        self.view.layoutIfNeeded()
        
        scrollView.addSubview(self.displayView2)
        self.displayView2.delegate = self
        
        print("top4Label.frame.maxY:\(top4View.frame.maxY)")

        let size2 = displayView2.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
        displayView2.frame = CGRect.init(x: 12, y: top4View.frame.maxY, width: size2.width, height: size2.height)
        
        
        self.view.layoutIfNeeded()
        print("displayView2.frame.maxY:\(displayView2.frame.maxY)")
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: displayView2.frame.maxY + 20)

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.player._deallocPlayer()
    }
}

extension GSZSJMDetailController:TLDisplayViewDelegate{
    func displayView(_ label: TLDisplayView!, openHeight height: CGFloat) {
        
        if label == displayView{
            var frame = self.displayView.frame
            frame.size.height = height
            self.displayView.frame = frame
            self.view.layoutIfNeeded()

            let size = displayView1.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
            displayView1.frame = CGRect.init(x: 12, y: self.top3ImageView.frame.maxY + 10, width: size.width, height: size.height)
            self.view.layoutIfNeeded()

            let size2 = displayView2.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
            displayView2.frame = CGRect.init(x: 12, y: top4View.frame.maxY, width: size2.width, height: size2.height)
            
        }else if label == displayView1{
            var frame = self.displayView1.frame
            frame.size.height = height
            self.displayView1.frame = frame
            
            self.view.layoutIfNeeded()

            let size2 = displayView2.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
            displayView2.frame = CGRect.init(x: 12, y: top4View.frame.maxY, width: size2.width, height: size2.height)
        }else if label == displayView2{
            var frame = self.displayView2.frame
            frame.size.height = height
            self.displayView2.frame = frame
           
        }

        self.view.layoutIfNeeded()
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: displayView2.frame.maxY + 20)

    }
    
    func displayView(_ label: TLDisplayView!, closeHeight height: CGFloat) {
        if label == displayView{
            var frame = self.displayView.frame
            frame.size.height = height
            self.displayView.frame = frame
            self.view.layoutIfNeeded()

            let size = displayView1.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
            displayView1.frame = CGRect.init(x: 12, y: self.top3ImageView.frame.maxY + 10, width: size.width, height: size.height)
            
            self.view.layoutIfNeeded()

            let size2 = displayView2.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
            displayView2.frame = CGRect.init(x: 12, y: top4View.frame.maxY, width: size2.width, height: size2.height)
            
            
        }else if label == displayView1{
            var frame = self.displayView1.frame
            frame.size.height = height
            self.displayView1.frame = frame
            
            self.view.layoutIfNeeded()
            
            let size2 = displayView2.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
            displayView2.frame = CGRect.init(x: 12, y: top4View.frame.maxY, width: size2.width, height: size2.height)
            
        }else if label == displayView2{
            var frame = self.displayView2.frame
            frame.size.height = height
            self.displayView2.frame = frame

        }
        
        
        self.view.layoutIfNeeded()
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: displayView2.frame.maxY + 20)

    }
}
