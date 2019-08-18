//
//  GSHomeCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/9.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit
import SDCycleScrollView

// 1.定义一个闭包类型
typealias GSHomeCellBlock = (_ index:NSInteger) -> Void

// 2. 声明一个变量
var cellBlock: GSHomeCellBlock?


class GSHomeCell: UITableViewCell {

    var toutiaoLabel:UILabel?
    var moreBtn:UIButton?

    
    lazy var cycleScrollView:SDCycleScrollView = {
        let cycleScrollView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 149), delegate: self, placeholderImage: UIImage.init(named: "meinv.jpg"))
        cycleScrollView?.pageDotColor = UIColor.cz_color(withHex: 0xFCD6AB)?.withAlphaComponent(0.3)
        cycleScrollView?.delegate = self
        cycleScrollView?.pageControlDotSize = CGSize.init(width: 5, height: 5)
        cycleScrollView?.currentPageDotColor = UIColor.cz_color(withHex: 0xFCD6AB)
        cycleScrollView?.imageURLStringsGroup = ["meinv.jpg","meinv.jpg","meinv.jpg","meinv.jpg","meinv.jpg"]
        return cycleScrollView!
    }()
    
    let navView:UIView = {
        let navView:UIView = UIView.init()
        navView.backgroundColor = UIColor.clear
        return navView
    }()
    
    let bottomView:UIView = {
        let bottomView:UIView = UIView.init()
        bottomView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return bottomView
    }()
    
    
    
    
    lazy var cycleScrollViewText:ZKCycleScrollView = {
        
        let cycleScrollViewText = ZKCycleScrollView.init()
        cycleScrollViewText.delegate = self
        cycleScrollViewText.dataSource = self
        cycleScrollViewText.allowsDragging = false
        cycleScrollViewText.hidesPageControl = true
        //        cycleScrollViewText.itemSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: 50)
        cycleScrollViewText.scrollDirection = ZKScrollDirection.vertical
        cycleScrollViewText.registerCellClass(GSHomeTextCell.self, forCellWithReuseIdentifier: "GSHomeTextCell")
        return cycleScrollViewText
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        // 轮播图
        addSubview(cycleScrollView)
        // 中间导航
        addSubview(navView)
        navView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(cycleScrollView.snp.bottom)
            make.height.equalTo(92)
        }
        
        let titleArr = ["库存采购","价值产品","招商加盟","贷款融资"]
        let imageArr = ["home_kucun","home_chanpin","home_jiameng","honge_daikuan"]

        var index:CGFloat = 0
        
        for (idx,item) in titleArr.enumerated() {
            
            let btn = UIButton.init(frame: CGRect.init(x:UIScreen.cz_screenWidth() / 4.0 * index, y: 0, width: UIScreen.cz_screenWidth() / 4.0, height: 92))
            navView.addSubview(btn)
            btn.backgroundColor = UIColor.clear
            btn.tag = Int(index)
            btn.addTarget(self, action: #selector(btnClick(button:)), for: .touchUpInside)
            let imageView = UIImageView.init()
            btn.addSubview(imageView)
            imageView.isUserInteractionEnabled = false
            imageView.image = UIImage.init(named: imageArr[idx])
            imageView.snp.makeConstraints { (make) in
                make.centerX.equalTo(btn)
                make.top.equalTo(btn.snp.top).offset(23)
                if idx == 1{
                    make.width.equalTo(21)
                    make.height.equalTo(22)
                }else if idx == 3{
                    make.width.equalTo(20)
                    make.height.equalTo(23)
                }else{
                    make.width.equalTo(22)
                    make.height.equalTo(21)
                }
                
            }
            
            let titleLabel = UILabel.init()
            btn.addSubview(titleLabel)
            titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
            titleLabel.font = UIFont.systemFont(ofSize: 12)
            titleLabel.text = item
            titleLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(btn)
                make.top.equalTo(imageView.snp.bottom).offset(13)
            }
            
            print(idx,item)
            index += 1
        }
        
        // 底部
        addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(50)
        }
        
        let toutiaoLabel = UILabel.init()
        toutiaoLabel.text = "头条快讯："
        toutiaoLabel.textColor = UIColor.cz_color(withHex: 0xAC9472)
        toutiaoLabel.font = UIFont.systemFont(ofSize: 14)
        bottomView.addSubview(toutiaoLabel)
        self.toutiaoLabel = toutiaoLabel
        toutiaoLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomView)
            make.left.equalTo(12)
        }
        
        let moreBtn = UIButton.init()
        moreBtn.setTitle("更多", for: .normal)
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        moreBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        bottomView.addSubview(moreBtn)
        moreBtn.addTarget(self, action: #selector(moreBtnClick), for: .touchUpInside)
        self.moreBtn = moreBtn
        moreBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomView)
            make.right.equalTo(-12)
            make.top.bottom.equalTo(bottomView)
        }
        self.layoutIfNeeded()
        // 上下滑动
        addSubview(cycleScrollViewText)
        cycleScrollViewText.backgroundColor = UIColor.clear
        cycleScrollViewText.snp.makeConstraints { (make) in
            make.left.equalTo(toutiaoLabel.snp.right)
            make.top.bottom.equalTo(bottomView)
            make.right.equalTo(moreBtn.snp.left).offset(-3)
        }

    }
    // 更多
    @objc func moreBtnClick(){
        self.viewController()?.navigationController?.pushViewController(GSHangYJQDTController.init(), animated: true)
    }
    
    @objc func btnClick(button:UIButton){
        
        print(button.tag)
        //4. 调用闭包,设置你想传递的参数,调用前先判定一下,是否已实现
        if cellBlock != nil {
            cellBlock!(button.tag)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model:GSMineSignModel? {
        didSet {
            guard let model = model else {return}
            // self.titleLabel.text = model.service_name
        }
    }
    
    
    // 3. 定义一个方法,方法的参数为和swiftBlock类型一致的闭包,并赋值给callBack
    func callBackBlock(block: @escaping GSHomeCellBlock) {
        cellBlock = block
    }
}


extension GSHomeCell:SDCycleScrollViewDelegate{
    @nonobjc func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print("点击" + "\(index)")
    }
}

extension GSHomeCell: ZKCycleScrollViewDelegate,ZKCycleScrollViewDataSource {
    
    

    func numberOfItems(in cycleScrollView: ZKCycleScrollView) -> Int {
        return 2

    }

    func cycleScrollView(_ cycleScrollView: ZKCycleScrollView, cellForItemAt index: Int) -> ZKCycleScrollViewCell {
        let cell = cycleScrollView.dequeueReusableCell(withReuseIdentifier: "GSHomeTextCell", for: index) as! GSHomeTextCell
        cell.titleLabel.text = "【一周大事记】三款macbook免费为三款macbook免费为"

        return cell

    }
    

    
    @nonobjc func cycleScrollView(_ cycleScrollView: ZKCycleScrollView, didSelectItemAt index: Int) {
        // TODO...
        print("点击\(index)")
//        if cycleScrollView ==  cycleScrollViewText{
//            self.viewController()?.navigationController?.pushViewController(LBSXWebController(), animated: true)
//        }

        self.viewController()?.navigationController?.pushViewController(GSHYJQDTDetailController.init(), animated: true)
    }
    func cycleScrollView(_ cycleScrollView: ZKCycleScrollView, didScrollFrom fromIndex: Int, to toIndex: Int) {
//        print("滑动\(toIndex)")
//            let cell = cycleScrollView.dequeueReusableCell(withReuseIdentifier: "TextCell", for: toIndex) as! TextCell
//            let model = self.evenArray[toIndex] as!LBSXHomePopmsgModel
//            cell.titleLabel.text = model.overview
//            cell.subTitleLabel.text = model.overview
//
    }
}

