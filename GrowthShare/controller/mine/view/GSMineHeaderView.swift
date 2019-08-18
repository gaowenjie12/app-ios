//
//  GSMineHeaderView.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/7.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

// 1.定义一个闭包类型
typealias GSMineHeaderViewBlock = () -> Void

// 2. 声明一个变量
var headerViewBlock: GSMineHeaderViewBlock?


class GSMineHeaderView: UICollectionReusableView {
    
    lazy var imageView:UIImageView = {
       
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "icon")
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    lazy var titleLabel:UILabel = {
        
        let titleLabel = UILabel.init()
        titleLabel.text = "王小波"
        titleLabel.textColor = UIColor.cz_color(withHex: 0x333333)
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        return titleLabel
    }()
    
    lazy var subtitleLabel:UILabel = {
        
        let subtitleLabel = UILabel.init()
        subtitleLabel.text = "编辑个人信息"
        subtitleLabel.textColor = UIColor.cz_color(withHex: 0x999999)
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        return subtitleLabel
    }()
    
    lazy var downView:UIView = {
        
        let downView = UIView.init()
        downView.backgroundColor = UIColor.cz_color(withHex: 0xF5F5F5)
        return downView
    }()
    
    lazy var signBtn:UIButton = {
        
        let signBtn = UIButton.init()
        signBtn.setTitle("签到", for: .normal)
        signBtn.setTitleColor(GSFontColor, for: .normal)
        signBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signBtn.layer.borderWidth = 1
        signBtn.layer.borderColor = GSFontColor?.cgColor
        signBtn.layer.cornerRadius = 5
        signBtn.layer.masksToBounds = true
        return signBtn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.top.equalTo(21)
            make.height.width.equalTo(60)
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageView.snp.right).offset(16)
            make.top.equalTo(imageView).offset(10)
        }
        
        self.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageView.snp.right).offset(16)
            make.bottom.equalTo(imageView).offset(-10)
        }
        
        self.addSubview(downView)
        downView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(10)
        }
        
        self.addSubview(signBtn)
        signBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-12)
            make.centerY.equalTo(imageView)
            make.height.equalTo(32)
            make.width.equalTo(60)
        }
        signBtn.addTarget(self, action: #selector(signBtnClick), for: .touchUpInside)
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
    func callBackBlock(block: @escaping GSMineHeaderViewBlock) {
        headerViewBlock = block
    }

}
