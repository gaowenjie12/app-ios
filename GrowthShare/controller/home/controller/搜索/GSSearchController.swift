//
//  GSSearchController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/9.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSSearchController: GSBaseController {
    private var titleArr:NSMutableArray?
    private var lcaIdArr:NSMutableArray?
    private var childVcs:NSMutableArray?
    private var titles:[String] = {
        let titles = ["按地域","按企业","按行业","按产品","按人名","按服务站"]
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
        let scrollPageView = ZJScrollPageView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - GSNavBarHeight), segmentStyle: self.style, titles: self.titles as? [String], parentViewController: self, delegate: self)
        return scrollPageView as! ZJScrollPageView
    }()
    private lazy var searchBar: UITextField = {
        let searchBar = UITextField()
        searchBar.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        searchBar.textColor = UIColor.cz_color(withHex: 0xDADADA)
        searchBar.tintColor = UIColor.darkGray
        searchBar.font = UIFont.systemFont(ofSize: 15)
        searchBar.placeholder = "请输入要搜索的内容"
        searchBar.layer.cornerRadius = 15
        
        searchBar.clearsOnBeginEditing = true
        searchBar.clearButtonMode = .whileEditing
        searchBar.returnKeyType = .search
        searchBar.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(textFiledTextDidChange(noti:)), name: UITextField.textDidChangeNotification, object: searchBar)
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView.init(image: UIImage.init(named: "home_search"))
//        imageView.backgroundColor = UIColor.red
        let searchView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 37, height: 30))
        searchView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.width.height.equalTo(15)
            make.center.equalTo(searchView)
        })
        
        searchBar.leftView = searchView
        searchBar.leftViewMode = .always
        
        searchBar.frame = CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth() - 50, height: 30)
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIButton.init())
        
        let rightItem = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 25, height: 25))
        rightItem.setTitle("取消", for: .normal)
        rightItem.setTitleColor(UIColor.cz_color(withHex: 0x222222), for: .normal)
        rightItem.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItem)
        rightItem.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)

        self.view.addSubview(scrollPageView)

    }
    @objc private func cancelAction() {
        searchBar.resignFirstResponder()
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension GSSearchController: UITextFieldDelegate {
    
    @objc func textFiledTextDidChange(noti: Notification) {
        guard let textField = noti.object as? UITextField,
            let text = textField.text else { return }
//        searchRelative(text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
extension GSSearchController: ZJScrollPageViewDelegate {
    
    func numberOfChildViewControllers() -> Int {
        return self.titles.count
    }
    func childViewController(_ reuseViewController: (UIViewController & ZJScrollPageViewChildVcDelegate)!, for index: Int) -> (UIViewController & ZJScrollPageViewChildVcDelegate)! {
        var childVc = reuseViewController
        
        childVc = GSSearchChildController.init() as? (UIViewController & ZJScrollPageViewChildVcDelegate)
        
        print("\(index)" + "\(String(describing: childVc))")
        return childVc;
    }
    
    override var shouldAutomaticallyForwardAppearanceMethods: Bool{
        return false
    }
}
