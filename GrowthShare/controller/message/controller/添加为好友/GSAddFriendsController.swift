//
//  GSAddFriendsController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSAddFriendsController: GSBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "添加"
        
        let nameLabel = UILabel.init()
        nameLabel.text = "姓名"
        nameLabel.textColor = UIColor.cz_color(withHex: 0x979797)
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(37)
            make.left.equalTo(self.view).offset(12)
        }
        
        self.view.layoutIfNeeded()
        
        let nameView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 8, height: 30))
        
        let nameTF = UITextField.init()
        nameTF.textColor = UIColor.cz_color(withHex: 0x222222)
        nameTF.font = UIFont.systemFont(ofSize: 15)
        nameTF.layer.cornerRadius = 4
        nameTF.layer.masksToBounds = true
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.cz_color(withHex: 0xB6B6B6)?.cgColor
        nameTF.leftView = nameView
        nameTF.leftViewMode = .always
        nameTF.placeholder = "请输入姓名"
        self.view.addSubview(nameTF)
        nameTF.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(15)
            make.width.equalTo(UIScreen.cz_screenWidth() - nameLabel.frame.maxX - 15 - 12)
            make.centerY.equalTo(nameLabel)
            make.height.equalTo(39)
        }
        
        let iphoneLabel = UILabel.init()
        iphoneLabel.text = "手机"
        iphoneLabel.textColor = UIColor.cz_color(withHex: 0x979797)
        iphoneLabel.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(iphoneLabel)
        iphoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(33)
            make.left.equalTo(nameLabel)
        }

        let iphoneView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 8, height: 30))

        let iphoneTF = UITextField.init()
        iphoneTF.textColor = UIColor.cz_color(withHex: 0x222222)
        iphoneTF.font = UIFont.systemFont(ofSize: 15)
        iphoneTF.layer.cornerRadius = 4
        iphoneTF.layer.masksToBounds = true
        iphoneTF.layer.borderWidth = 1
        iphoneTF.layer.borderColor = UIColor.cz_color(withHex: 0xB6B6B6)?.cgColor
        iphoneTF.leftView = iphoneView
        iphoneTF.leftViewMode = .always
        iphoneTF.placeholder = "请输入手机"
        self.view.addSubview(iphoneTF)
        iphoneTF.snp.makeConstraints { (make) in
            make.centerY.equalTo(iphoneLabel)
            make.left.equalTo(iphoneLabel.snp.right).offset(15)
            make.right.equalTo(nameTF)
            make.height.equalTo(39)
        }
        
    
        let commitBtn = UIButton.init()
        commitBtn.setTitle("添加为我的好友", for: .normal)
        commitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        commitBtn.setTitleColor(UIColor.white, for: .normal)
        commitBtn.backgroundColor = UIColor.cz_color(withHex: 0x15325E)
        commitBtn.layer.cornerRadius = 5
        commitBtn.layer.masksToBounds = true
        self.view.addSubview(commitBtn)
        commitBtn.addTarget(self, action: #selector(commitBtnClick), for: .touchUpInside)
        commitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(iphoneTF.snp.bottom).offset(25)
            make.left.equalTo(self.view).offset(12)
            make.right.equalTo(self.view).offset(-12)
            make.height.equalTo(38)
        }

        
        
    }
    
    @objc func commitBtnClick(){
        
    }
    

}
