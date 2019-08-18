//
//  GSFollowController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/5.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSFollowController: GSBaseController {
   
    private var titleArr:NSMutableArray?
    private var lcaIdArr:NSMutableArray?
    private var childVcs:NSMutableArray?
    private var titles:[String] = {
       let titles = ["分会介绍","架构文化","事件","信箱"]
       return titles
    }()

    private lazy var style: ZJSegmentStyle = {
        let style = ZJSegmentStyle.init()
        //显示滚动条
        style.isShowLine = true
        style.scrollLineColor = UIColor.cz_color(withHex: 0xAC9472)
        style.scrollLineHeight = 2.5
//        style.isAdjustCoverOrLineWidth = true
        style.isScaleTitle = false;
//        style.isScrollTitle = true
        style.isAutoAdjustTitlesWidth = true
        style.titleFont = UIFont.systemFont(ofSize: 15)
        style.normalTitleColor = UIColor.cz_color(withHex: 0xB6B6B6)
        style.selectedTitleColor = UIColor.cz_color(withHex: 0xAC9472)
        style.isGradualChangeTitleColor = true
        style.isScrollContentView = false
        return style
    }()
    
    private lazy var scrollPageView: ZJScrollPageView = {
        let scrollPageView = ZJScrollPageView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - GSTabBarHeight - GSNavBarHeight), segmentStyle: self.style, titles: self.titles as? [String], parentViewController: self, delegate: self)
        
        return scrollPageView as! ZJScrollPageView
    }()

    private lazy var searchButon: UIButton = {
        let searchButon = UIButton(type: .system)
        searchButon.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30)
        searchButon.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        searchButon.layer.cornerRadius = 15
        searchButon.setTitle("请输入要搜索的内容", for: .normal)
        searchButon.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        searchButon.setTitleColor(UIColor.cz_color(withHex: 0xDADADA), for: .normal)
        searchButon.setImage(UIImage(named: "home_search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButon.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        searchButon.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        searchButon.addTarget(self, action:#selector(searchButtonClick), for: .touchUpInside)
        return searchButon
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollPageView)
        
        setupSearch()
    }
    
    func setupSearch() {
        
        
        navigationItem.titleView = searchButon
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil,
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil,
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    @objc func searchButtonClick(){
        self.navigationController?.pushViewController(GSSearchController.init(), animated: true)
        
    }
    
}
extension GSFollowController: ZJScrollPageViewDelegate {
    
    func numberOfChildViewControllers() -> Int {
        return self.titles.count
    }
    func childViewController(_ reuseViewController: (UIViewController & ZJScrollPageViewChildVcDelegate)!, for index: Int) -> (UIViewController & ZJScrollPageViewChildVcDelegate)! {
        var childVc = reuseViewController
        
//        UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
        
        if index == 0 {
            childVc = GSFollowFenHuiController.init() as? (UIViewController & ZJScrollPageViewChildVcDelegate)

        }else if index == 1{
            childVc = GSFollowJiaGouController.init() as? (UIViewController & ZJScrollPageViewChildVcDelegate)

        }else if index == 2{
            childVc = GSFollowShiJianController.init() as? (UIViewController & ZJScrollPageViewChildVcDelegate)

        }else if index == 3{
            childVc = GSFollwXinXiangController.init() as? (UIViewController & ZJScrollPageViewChildVcDelegate)

        }

        print("\(index)" + "\(String(describing: childVc))")
        return childVc;
    }
    
    override var shouldAutomaticallyForwardAppearanceMethods: Bool{
        return false
    }
}
