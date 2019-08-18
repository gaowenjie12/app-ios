//
//  GSRegisterController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/5.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSRegisterController: GSBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupLayout()
    }
    
    // 布局
    func setupLayout() {
        
        let titleLabel = UILabel.init()
        titleLabel.text = "账号注册"
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textColor = UIColor.cz_color(withHex: 0xAC9472)
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(36)
            make.centerX.equalTo(self.view)
            
        }
        
        
        let iphoneTF = UITextField.init()
        iphoneTF.placeholder = "请输入手机号"
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
        
        let codeBtn = UIButton.init()
        codeBtn.setTitle("获取验证码", for: .normal)
        codeBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        codeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(codeBtn)
        codeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(iphoneLine.snp.bottom).offset(24)
            make.right.equalTo(iphoneLine)
        }
        codeBtn.addTarget(self, action: #selector(codeBtnClick), for: .touchUpInside)

        
        let codeTF = UITextField.init()
        codeTF.placeholder = "请输入短信验证码"
//        codeTF.backgroundColor = UIColor.red
        codeTF.setValue(UIColor.cz_color(withHex: 0xDADADA), forKeyPath: "_placeholderLabel.textColor")
        codeTF.setValue(UIFont.systemFont(ofSize: 15), forKeyPath: "_placeholderLabel.font")
        self.view.addSubview(codeTF)
        codeTF.snp.makeConstraints { (make) in
            make.centerY.equalTo(codeBtn)
            make.left.equalToSuperview().offset(41)
            make.right.equalTo(-138)
        }
        
        let codeLine = UIView.init()
        codeLine.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
        self.view.addSubview(codeLine)
        codeLine.snp.makeConstraints { (make) in
            make.top.equalTo(codeTF.snp.bottom).offset(12)
            make.left.right.equalTo(iphoneLine)
            make.height.equalTo(1)
        }
        
        
        let passwordTF = UITextField.init()
        passwordTF.placeholder = "请输入6~20位密码"
        passwordTF.setValue(UIColor.cz_color(withHex: 0xDADADA), forKeyPath: "_placeholderLabel.textColor")
        passwordTF.setValue(UIFont.systemFont(ofSize: 15), forKeyPath: "_placeholderLabel.font")
        self.view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { (make) in
            make.top.equalTo(codeLine.snp.bottom).offset(24)
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
        loginBtn.setTitle("立即注册", for: .normal)
        loginBtn.backgroundColor = UIColor.cz_color(withHex: 0xAC9472)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLine.snp.bottom).offset(50)
            make.left.right.equalTo(passwordTF)
            make.height.equalTo(38)
        }
        
        let xieyiLabel = UILabel.init()
        self.view.addSubview(xieyiLabel)
        xieyiLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.snp.bottom).offset(-58)
        }
        self.downCountAttributedleftString(label: xieyiLabel, leftString: "  我已阅读并接受", rightString: "《用户服务协议》")
        
        
        let selectBtn = UIButton.init()
        selectBtn.isSelected = true
        selectBtn.setImage(UIImage.init(named: "gou"), for: .selected)
        selectBtn.setImage(UIImage.init(named: ""), for: .normal)
        selectBtn.layer.borderWidth = 1
        selectBtn.layer.borderColor = UIColor.cz_color(withHex: 0xAC9472)?.cgColor
        self.view.addSubview(selectBtn)
        selectBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(xieyiLabel)
            make.right.equalTo(xieyiLabel.snp.left).offset(-5)
            make.height.width.equalTo(11)
        }
        selectBtn.addTarget(self, action: #selector(selectBtnClick(button:)), for: .touchUpInside)
        
        
        let xieyiBtn = UIButton.init()
        xieyiBtn.setTitle("《用户服务协议》", for: .normal)
        xieyiBtn.setTitleColor(UIColor.clear, for: .normal)
        xieyiBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.view.addSubview(xieyiBtn)
        xieyiBtn.snp.makeConstraints { (make) in
            make.right.equalTo(xieyiLabel)
            make.centerY.equalTo(xieyiLabel)
        }
        xieyiBtn.addTarget(self, action: #selector(xieyiBtnClick), for: .touchUpInside)
    }
    // 协议跳转
    @objc func xieyiBtnClick(){
        
        self.navigationController?.pushViewController(GSUserAgreeController.init(), animated: true)
    }
    // 选择
    @objc func selectBtnClick(button:UIButton){
        button.isSelected = !button.isSelected
    }
    func downCountAttributedleftString(label:UILabel,leftString:String,rightString:String) -> Void {
        let string = NSMutableAttributedString.init(string: leftString, attributes: [NSAttributedString.Key.foregroundColor:UIColor.cz_color(withHex: 0xDADADA) as Any,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12)])
        let rightS = NSMutableAttributedString.init(string: rightString, attributes: [NSAttributedString.Key.foregroundColor:UIColor.cz_color(withHex: 0xAC9472) as Any,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12)])
        string.insert(rightS, at: leftString.count)
        label.attributedText = string
    }
    
    // 验证码
    @objc func codeBtnClick(){
        
    }
}
extension GSRegisterController{
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
