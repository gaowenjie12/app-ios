//
//  GSCompanyJJController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/16.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSCompanyJJController: GSBaseController {

    private lazy var top3View:UIView = {
        let top3View = UIView.init()
        top3View.backgroundColor = UIColor.white
        return top3View
    }()
    
    private lazy var top2View:UIView = {
        let top2View = UIView.init()
        top2View.backgroundColor = UIColor.white
        return top2View
    }()
    
    
    private lazy var textView:UITextView = {
        let textView = UITextView.init()
        textView.placeholder = "请输入要留言的内容"
        textView.placeholderColor = UIColor.cz_color(withHex: 0xDADADA)
        textView.placeholderLabel.font = UIFont.systemFont(ofSize: 15)
        textView.layer.cornerRadius = 4
        textView.layer.masksToBounds = true
        textView.layer.borderColor = UIColor.cz_color(withHex: 0xB6B6B6)?.cgColor
        textView.layer.borderWidth = 1
        return textView
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
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - GSNavBarHeight))
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = UIColor.white
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    lazy var collectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: 100, height: 48)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
        collectionView.register(GSJiaZhiCPCollectionCell.self, forCellWithReuseIdentifier:"GSJiaZhiCPCollectionCell")
        return collectionView
    }()
    
    
    // 1.第一组
    
    private var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.white
        return topView
    }()
    
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.cz_color(withHex: 0x222222)
        label.text = "阿里巴巴集团"
        label.numberOfLines = 2
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "主营业务：屏幕、平板等等"
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
//        self.view.addSubview(self.player)
        
        
        // mark:添加滑动视图
        self.view.addSubview(self.scrollView)
        
        
        // 1.第一组
        
        scrollView.addSubview(self.topView)
        topView.snp.makeConstraints { (make) in
            make.height.equalTo(250)
            make.top.left.equalTo(scrollView)
            make.width.equalTo(UIScreen.cz_screenWidth())
        }
        let topImageView = UIImageView.init()
        topImageView.layer.cornerRadius = 35
        topImageView.layer.masksToBounds = true
        topView.addSubview(topImageView)
        topImageView.image = UIImage.init(named: "meinv.jpg")
        topImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(70)
            make.top.equalTo(topView).offset(36)
        }
        
        topView.addSubview(titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topImageView.snp.bottom).offset(16)
            make.centerX.equalTo(self.view)
        }
        
        topView.addSubview(self.subTitleLabel)
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.centerX.equalTo(self.view)
        }
        
        let topDownView = UIView.init()
        topDownView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        topView.addSubview(topDownView)
        topDownView.snp.makeConstraints { (make) in
            make.left.right.equalTo(topView)
            make.bottom.equalTo(-50)
            make.height.equalTo(10)
        }
        
        let topDownLineView = UIView.init()
        topDownLineView.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
        topView.addSubview(topDownLineView)
        topDownLineView.snp.makeConstraints { (make) in
            make.top.equalTo(topDownView.snp.bottom).offset(25)
            make.left.equalTo(58)
            make.right.equalTo(-58)
            make.height.equalTo(1)

        }
        
        let topDownLabel = UILabel.init()
        topDownLabel.text = "企业宣传片"
        topDownLabel.textColor = UIColor.cz_color(withHex: 0x222222)
        topDownLabel.backgroundColor = UIColor.white
        topDownLabel.textAlignment = .center
        topDownLabel.font = UIFont.systemFont(ofSize: 15)
        topView.addSubview(topDownLabel)
        topDownLabel.snp.makeConstraints { (make) in
            make.center.equalTo(topDownLineView)
            make.width.equalTo(100)
        }
        
        
//        let top2View = UIView.init()
        top2View.backgroundColor = UIColor.white
        scrollView.addSubview(top2View)
        top2View.snp.makeConstraints { (make) in
            make.height.equalTo(240)
            make.top.equalTo(topView.snp.bottom)
            make.left.equalTo(scrollView)
            make.width.equalTo(UIScreen.cz_screenWidth())
        }
        
//        self.view.layoutIfNeeded()
        
        top2View.addSubview(self.player)
        let topDown2View = UIView.init()
        topDown2View.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        top2View.addSubview(topDown2View)
        topDown2View.snp.makeConstraints { (make) in
            make.left.right.equalTo(top2View)
            make.top.equalTo(self.player.snp.bottom)
            make.height.equalTo(10)
        }


        let topDown2LineView = UIView.init()
        topDown2LineView.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
        top2View.addSubview(topDown2LineView)
        topDown2LineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(top2View.snp.bottom).offset(-20)
            make.left.equalTo(58)
            make.right.equalTo(-58)
            make.height.equalTo(1)
        }

        let topDown2Label = UILabel.init()
        topDown2Label.text = "企业相册"
        topDown2Label.textColor = UIColor.cz_color(withHex: 0x222222)
        topDown2Label.backgroundColor = UIColor.white
        topDown2Label.textAlignment = .center
        topDown2Label.font = UIFont.systemFont(ofSize: 15)
        top2View.addSubview(topDown2Label)
        topDown2Label.snp.makeConstraints { (make) in
            make.center.equalTo(topDown2LineView)
            make.width.equalTo(100)
        }
        
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(top2View.snp.bottom)
            make.height.equalTo(80)
        }
        
        let topDown3View = UIView.init()
        topDown3View.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        scrollView.addSubview(topDown3View)
        topDown3View.snp.makeConstraints { (make) in
            make.left.equalTo(scrollView)
            make.width.equalTo(UIScreen.cz_screenWidth())
            make.top.equalTo(collectionView.snp.bottom)
            make.height.equalTo(10)
        }
        
        
        
        
        let qiyeLabel = UILabel.init()
        qiyeLabel.text = "查看企业"
        qiyeLabel.font = UIFont.systemFont(ofSize: 15)
        qiyeLabel.textColor = UIColor.cz_color(withHex: 0x333333)
        qiyeLabel.textAlignment = .left
        scrollView.addSubview(qiyeLabel)
        qiyeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topDown3View.snp.bottom).offset(18)
            make.left.equalTo(12)
            make.width.equalTo(UIScreen.cz_screenWidth())
        }


        let qiyeBtn = UIButton.init()
        qiyeBtn.setTitle("产品列表", for: .normal)
        qiyeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        qiyeBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        qiyeBtn.titleLabel?.textAlignment = .left
        scrollView.addSubview(qiyeBtn)
        qiyeBtn.addTarget(self, action: #selector(qiyeBtnClick), for: .touchUpInside)
        qiyeBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-12)
            make.centerY.equalTo(qiyeLabel)
        }


        let lineView = UIView.init()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        scrollView.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(qiyeLabel.snp.bottom).offset(18)
            make.height.equalTo(1)
            make.width.equalTo(UIScreen.cz_screenWidth())
            make.left.equalTo(self.view)
        }

        self.view.layoutIfNeeded()
         // 2.第二组
        scrollView.addSubview(self.displayView)
        self.displayView.delegate = self
        let size0 = displayView.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
        displayView.frame = CGRect.init(x: 12, y: lineView.frame.maxY + 10, width: size0.width, height: size0.height)


        let topDown4View = UIView.init()
        topDown4View.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        scrollView.addSubview(topDown4View)
        topDown4View.snp.makeConstraints { (make) in
            make.left.equalTo(scrollView)
            make.width.equalTo(UIScreen.cz_screenWidth())
            make.top.equalTo(displayView.snp.bottom).offset(10)
            make.height.equalTo(10)
        }

        scrollView.addSubview(top3View)
        top3View.snp.makeConstraints { (make) in
            make.height.equalTo(352)
            make.left.equalTo(self.view)
            make.width.equalTo(UIScreen.cz_screenWidth())
            make.top.equalTo(topDown4View.snp.bottom)
        }

        let top3Label = UILabel.init()
        top3Label.text = "留言"
        top3Label.textColor = UIColor.cz_color(withHex: 0x222222)
        top3Label.font = UIFont.systemFont(ofSize: 16)
        top3View.addSubview(top3Label)
        top3Label.snp.makeConstraints { (make) in
            make.top.equalTo(topDown4View.snp.bottom).offset(13)
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


        top3View.addSubview(self.textView)
        self.textView.snp.makeConstraints { (make) in
            make.top.equalTo(iphoneTF.snp.bottom).offset(10)
            make.left.equalTo(12)
            make.width.equalTo(UIScreen.cz_screenWidth() - 24)
            make.height.equalTo(155)
        }

        let commitBtn = UIButton.init()
        commitBtn.setTitle("提交", for: .normal)
        commitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        commitBtn.setTitleColor(UIColor.white, for: .normal)
        commitBtn.backgroundColor = UIColor.cz_color(withHex: 0xAC9472)
        commitBtn.layer.cornerRadius = 5
        commitBtn.layer.masksToBounds = true
        top3View.addSubview(commitBtn)
        commitBtn.addTarget(self, action: #selector(commitBtnClick), for: .touchUpInside)
        commitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom).offset(20)
            make.left.equalTo(top3View).offset(12)
            make.right.equalTo(top3View).offset(-12)
            make.height.equalTo(38)
        }

        self.view.layoutIfNeeded()

        scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 40)
        
        self.title = "企业简介"
        self.setupItems()
    }
    
    // 产品列表
    @objc func qiyeBtnClick(){
        self.navigationController?.pushViewController(GSJiaZhiCPController.init(), animated: true)
    }
    
    func setupItems() {
        
        
        let rightItem = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 17, height: 17))
        rightItem.setImage(UIImage.init(named: "shoucang_pre"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightItem)
        rightItem.addTarget(self, action: #selector(setupRightItem), for: .touchUpInside)
        
        let rightItem2 = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 17, height: 17))
        rightItem2.setImage(UIImage.init(named: "liebiao"), for: .normal)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem.init(customView: rightItem),UIBarButtonItem.init(customView: rightItem2)]
        rightItem2.addTarget(self, action: #selector(setupRightItem2), for: .touchUpInside)
    }
    
    @objc func setupRightItem(){
        
    }
    @objc func setupRightItem2(){
        self.navigationController?.pushViewController(GSJiaZhiCPController.init(), animated: true)
    }
    @objc func commitBtnClick(){
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.player._deallocPlayer()
    }
}

extension GSCompanyJJController:TLDisplayViewDelegate{
    func displayView(_ label: TLDisplayView!, openHeight height: CGFloat) {
        
        var frame = self.displayView.frame
        frame.size.height = height
        self.displayView.frame = frame
        
        self.view.layoutIfNeeded()
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 40)
        
    }
    
    func displayView(_ label: TLDisplayView!, closeHeight height: CGFloat) {
        
        var frame = self.displayView.frame
        frame.size.height = height
        self.displayView.frame = frame
        
        self.view.layoutIfNeeded()
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 40)
        
    }
}
extension GSCompanyJJController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GSJiaZhiCPCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GSJiaZhiCPCollectionCell", for: indexPath) as! GSJiaZhiCPCollectionCell
        //        cell.dic = self.dataArray[indexPath.row] as? [String:String]
        return cell
    }
    
    // 每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        
    }
}
