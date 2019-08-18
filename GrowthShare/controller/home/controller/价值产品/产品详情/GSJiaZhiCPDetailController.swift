//
//  GSJiaZhiCPDetailController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/16.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSJiaZhiCPDetailController: GSBaseController {
    
    private lazy var top3View:UIView = {
        let top3View = UIView.init()
        top3View.backgroundColor = UIColor.white
        return top3View
    }()
    private var arrowImageV:UIImageView = {
        
        let arrowImageV = UIImageView()
        arrowImageV.image = UIImage.init(named: "youjiantou")
        return arrowImageV
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
        self.title = "产品介绍"
        if Int(UIDevice.current.systemVersion) ?? 0 > 7 {
            self.edgesForExtendedLayout = []
        }
        // 1. 添加视频播放器
        self.view.addSubview(self.player)
        
        
        // mark:添加滑动视图
        self.view.addSubview(self.scrollView)
        // 滑动视图
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(scrollView)
            make.height.equalTo(80)
        }
        
        // 1.第一组
        
        scrollView.addSubview(self.titleLabel)
        self.titleLabel.backgroundColor = UIColor.white
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom).offset(15)
            make.left.equalTo(self.view).offset(12)
            make.right.equalTo(self.view).offset(-12)
        }
        
        scrollView.addSubview(self.subTitleLabel)
        self.subTitleLabel.backgroundColor = UIColor.white
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
            make.height.equalTo(50)
        }
        
        let lookCompanyBtn = UIButton.init()
//        lookCompanyBtn.setTitle("查看企业", for: .normal)
//        lookCompanyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        lookCompanyBtn.setTitleColor(UIColor.cz_color(withHex: 0x333333), for: .normal)
//        lookCompanyBtn.titleLabel?.textAlignment = .left
        top3View.addSubview(lookCompanyBtn)
        lookCompanyBtn.addTarget(self, action: #selector(lookCompanyBtnClick), for: .touchUpInside)
        lookCompanyBtn.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(top3View)
            make.left.equalTo(top3View).offset(12)
        }
        
        let lookCompanyLabel = UILabel.init()
        lookCompanyLabel.text = "查看企业"
        lookCompanyLabel.font = UIFont.systemFont(ofSize: 15)
        lookCompanyLabel.textColor = UIColor.cz_color(withHex: 0x333333)
        top3View.addSubview(lookCompanyLabel)
        lookCompanyLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(top3View)
            make.left.equalTo(lookCompanyBtn)
        }
        
        top3View.addSubview(self.arrowImageV)
        self.arrowImageV.snp.makeConstraints { (make) in
            make.width.equalTo(7)
            make.height.equalTo(13)
            make.right.equalTo(top3View).offset(-12)
            make.centerY.equalTo(top3View)
        }
        
        let lineView = UIView.init()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        top3View.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(lookCompanyBtn)
            make.height.equalTo(1)
        }
        
        self.view.layoutIfNeeded()
        print("\(top3View.frame.maxY)")
//        scrollView.backgroundColor = UIColor.cz_color(withHex: 0xF5F5F5)
        scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 10)
        
        self.setupItems()
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
    @objc func lookCompanyBtnClick(){
        self.navigationController?.pushViewController(GSCompanyJJController.init(), animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.player._deallocPlayer()
    }
}

extension GSJiaZhiCPDetailController:TLDisplayViewDelegate{
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
extension GSJiaZhiCPDetailController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
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

