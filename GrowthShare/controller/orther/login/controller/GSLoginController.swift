//
//  GSLoginController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/5.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit
import SnapKit


class GSLoginController: GSBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
    }
    
    // 布局
    func setupLayout() {
        
        let titleLabel = UILabel.init()
        titleLabel.text = "登录亿企共享"
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textColor = UIColor.cz_color(withHex: 0xAC9472)
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(36)
            make.centerX.equalTo(self.view)
            
        }
        
        
        let iphoneTF = UITextField.init()
        iphoneTF.placeholder = "手机号"
        iphoneTF.setValue(UIColor.cz_color(withHex: 0xDADADA), forKeyPath: "_placeholderLabel.textColor")
        iphoneTF.setValue(UIFont.systemFont(ofSize: 15), forKeyPath: "_placeholderLabel.font")
        self.view.addSubview(iphoneTF)
        iphoneTF.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(64)
            make.left.equalTo(41)
            make.right.equalTo(-41)
        }
        
        let iphoneLine = UIView.init()
        iphoneLine.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
        self.view.addSubview(iphoneLine)
        iphoneLine.snp.makeConstraints { (make) in
            make.top.equalTo(iphoneTF.snp.bottom).offset(12)
            make.left.right.equalTo(iphoneTF)
            make.height.equalTo(1)
        }
        
        let passwordTF = UITextField.init()
        passwordTF.placeholder = "密码"
        passwordTF.setValue(UIColor.cz_color(withHex: 0xDADADA), forKeyPath: "_placeholderLabel.textColor")
        passwordTF.setValue(UIFont.systemFont(ofSize: 15), forKeyPath: "_placeholderLabel.font")
        self.view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { (make) in
            make.top.equalTo(iphoneLine.snp.bottom).offset(24)
            make.left.equalTo(41)
            make.right.equalTo(-41)
        }
        
        let passwordLine = UIView.init()
        passwordLine.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
        self.view.addSubview(passwordLine)
        passwordLine.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTF.snp.bottom).offset(12)
            make.left.right.equalTo(passwordTF)
            make.height.equalTo(1)
        }
        
        let loginBtn = UIButton.init()
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
        loginBtn.setTitleColor(UIColor.cz_color(withHex: 0xB6B6B6), for: .normal)
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLine.snp.bottom).offset(50)
            make.left.right.equalTo(passwordTF)
            make.height.equalTo(38)
        }
        
        
        let registerBtn = UIButton.init()
        registerBtn.setTitle("立即注册", for: .normal)
        registerBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(26)
            make.left.equalTo(passwordTF)
        }
        registerBtn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)

        
        
        let forgetBtn = UIButton.init()
        forgetBtn.setTitle("忘记密码？", for: .normal)
        forgetBtn.setTitleColor(UIColor.cz_color(withHex: 0xDADADA), for: .normal)
        forgetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(forgetBtn)
        forgetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(26)
            make.right.equalTo(passwordTF)
        }
        forgetBtn.addTarget(self, action: #selector(forgetBtnClick), for: .touchUpInside)
        
        
        
        let wechatBtn = UIButton.init()
        wechatBtn.setImage(UIImage.init(named: "login_weixin"), for: .normal)
        self.view.addSubview(wechatBtn)
        wechatBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-109)
            make.centerX.equalTo(self.view)
            make.width.equalTo(30)
            make.height.equalTo(25)
        }
        wechatBtn.addTarget(self, action: #selector(wechatBtnClick), for: .touchUpInside)
        
        let qqBtn = UIButton.init()
        qqBtn.setImage(UIImage.init(named: "login_qq"), for: .normal)
        self.view.addSubview(qqBtn)
        qqBtn.snp.makeConstraints { (make) in
            make.right.equalTo(wechatBtn.snp.left).offset(-(UIScreen.cz_screenWidth() / 2.0 - 15 - 25) / 2.0)
            make.centerY.equalTo(wechatBtn)
            make.width.equalTo(25)
            make.height.equalTo(26)
        }
        qqBtn.addTarget(self, action: #selector(qqBtnClick), for: .touchUpInside)
        
        let weiboBtn = UIButton.init()
        weiboBtn.setImage(UIImage.init(named: "login_weibo"), for: .normal)
        self.view.addSubview(weiboBtn)
        weiboBtn.snp.makeConstraints { (make) in
            make.left.equalTo(wechatBtn.snp.right).offset((UIScreen.cz_screenWidth() / 2.0 - 15 - 30) / 2.0)
            make.centerY.equalTo(wechatBtn)
            make.width.equalTo(30)
            make.height.equalTo(25)
        }
        weiboBtn.addTarget(self, action: #selector(weiboBtnClick), for: .touchUpInside)
        
        
        let lineView = UIView.init()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
        self.view.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(65)
            make.right.equalTo(-65)
            make.height.equalTo(1)
            make.bottom.equalTo(weiboBtn.snp.top).offset(-29)
        }
    
        let orLabel = UILabel.init()
        orLabel.text = "OR"
        orLabel.textColor = UIColor.cz_color(withHex: 0x979797)
        orLabel.font = UIFont.systemFont(ofSize: 14)
        orLabel.backgroundColor = UIColor.white
        orLabel.textAlignment = .center
        self.view.addSubview(orLabel)
        orLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(45)
            make.centerY.equalTo(lineView)
        }
        
        
        
        
    }
    
    // 微信
    @objc func wechatBtnClick(){
        
    }
    
    // qq
    @objc func qqBtnClick(){
        
    }
    
    // 微博
    @objc func weiboBtnClick() {
        
    }
    
    // 注册
    @objc func registerBtnClick(){
        self.navigationController?.pushViewController(GSRegisterController.init(), animated: true)
    }
    // 忘记密码
    @objc func forgetBtnClick() {
        
    }
}

extension GSLoginController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1.隐藏
        if self.navigationController != nil {
            let navBarHairlineImageView = self.foundNavigationBarBottomLine(sView: self.navigationController!.navigationBar)
            navBarHairlineImageView.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 2.显示
        if self.navigationController != nil {
            let navBarHairlineImageView = self.foundNavigationBarBottomLine(sView: self.navigationController!.navigationBar)
            navBarHairlineImageView.isHidden = false
        }
        
    }
    
    
    func foundNavigationBarBottomLine(sView: UIView) ->UIImageView {
        if sView.isKind(of: UIImageView.self) && sView.bounds.height <= 1 {
            return sView as! UIImageView
        }
        for sview in sView.subviews {
            let imgs = self.foundNavigationBarBottomLine(sView: sview)
            if imgs.isKind(of: UIImageView.self) && imgs.bounds.height <= 1 {
                return imgs
            }
        }
        return UIImageView.init()
    }
}
