//
//  GSSearchChildHeaderView.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/13.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

// 1.定义一个闭包类型
typealias GSSearchChildHeaderViewBlock = () -> Void

// 2. 声明一个变量
var searchHeaderViewBlock: GSSearchChildHeaderViewBlock?


class GSSearchChildHeaderView: UICollectionReusableView {
    
    lazy var deleteBtn:UIButton = {
        
        let deleteBtn = UIButton.init()
        deleteBtn.setImage(UIImage.init(named: "shanchu"), for: .normal)
        return deleteBtn
    }()
    
    lazy var titleLabel:UILabel = {
        
        let titleLabel = UILabel.init()
        titleLabel.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        return titleLabel
    }()
    
    lazy var downView:UIView = {
        
        let downView = UIView.init()
        downView.backgroundColor = UIColor.white
        return downView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(downView)
        downView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
            make.height.equalTo(50)
        }
        
        downView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.top.equalTo(20)
        
        }
        
        downView.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.centerY.equalTo(titleLabel)
            make.height.equalTo(14)
            make.width.equalTo(12)
        }
        
      
    }
    
    @objc func signBtnClick(){
        //4. 调用闭包,设置你想传递的参数,调用前先判定一下,是否已实现
        if headerViewBlock != nil {
            headerViewBlock!()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 3. 定义一个方法,方法的参数为和swiftBlock类型一致的闭包,并赋值给callBack
    func callBackBlock(block: @escaping GSSearchChildHeaderViewBlock) {
        headerViewBlock = block
    }
    
}
