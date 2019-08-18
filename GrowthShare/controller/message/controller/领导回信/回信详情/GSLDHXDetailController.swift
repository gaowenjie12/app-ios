//
//  GSLDHXDetailController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSLDHXDetailController: GSBaseController {
    
    
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSLDHXDetailSection1Cell.self, forCellReuseIdentifier: "GSLDHXDetailSection1Cell")
        tableView.tableFooterView = UIView.init();
        tableView.estimatedRowHeight = 500
        
        return tableView
    }()
    private  lazy var downBtn: UIButton = {
        let downBtn = UIButton.init()
        downBtn.backgroundColor = UIColor.cz_color(withHex: 0x000000)?.withAlphaComponent(0.5)
        downBtn.addTarget(self, action: #selector(downBtnClick), for: .touchUpInside)
        return downBtn
    }()
    
    private  lazy var textView: UITextView = {
        let textView = UITextView.init()
        textView.backgroundColor = UIColor.white
        textView.layer.borderColor = UIColor.cz_color(withHex: 0xF4F4F4)?.cgColor
        textView.layer.borderWidth = 1
        textView.placeholder = "请输入留言内容"
        textView.placeholderLabel.font = UIFont.systemFont(ofSize: 15)
        textView.placeholderColor = UIColor.cz_color(withHex: 0xDADADA)
        return textView
    }()
    
    private  lazy var commitBtn: UIButton = {
        let commitBtn = UIButton.init()
        commitBtn.backgroundColor = UIColor.cz_color(withHex: 0x000000)?.withAlphaComponent(0.5)
        commitBtn.layer.cornerRadius = 5
        commitBtn.layer.masksToBounds = true
        commitBtn.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
        commitBtn.setTitle("提交", for: .normal)
        commitBtn.setTitleColor(UIColor.cz_color(withHex: 0xB6B6B6), for: .normal)
        commitBtn.addTarget(self, action: #selector(commitBtnClick), for: .touchUpInside)
        return commitBtn
    }()
    
    
    private  lazy var downView: UIView = {
        let downView = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.cz_screenHeight(), width: UIScreen.cz_screenWidth(), height: 325))
        downView.backgroundColor = UIColor.white
        return downView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "部长回信"
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        
    }
}
extension GSLDHXDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSLDHXDetailSection1Cell", for: indexPath) as! GSLDHXDetailSection1Cell
            return cell
        }
        
        return UITableViewCell.init()
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(GSLDHXDetailController.init(), animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView.init()
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 0 {
            
            let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 50))
            let timeLabel = UILabel.init()
            footerView.addSubview(timeLabel)
            timeLabel.text = "时间：2019-06-06 15:00"
            timeLabel.font = UIFont.systemFont(ofSize: 13)
            timeLabel.textColor = UIColor.cz_color(withHex: 0x979797)
            timeLabel.snp.makeConstraints { (make) in
                make.left.equalTo(12)
                make.centerY.equalTo(footerView)
            }
            
            let applyBtn = UIButton.init()
            footerView.addSubview(applyBtn)
            applyBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
            applyBtn.setTitle("回复", for: .normal)
            applyBtn.layer.cornerRadius = 9
            applyBtn.layer.masksToBounds = true
            applyBtn.layer.borderWidth = 1
            applyBtn.layer.borderColor = UIColor.cz_color(withHex: 0xAC9472)?.cgColor
            applyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            applyBtn.addTarget(self, action: #selector(applyBtnClick), for: .touchUpInside)
            applyBtn.snp.makeConstraints { (make) in
                make.right.equalTo(-12)
                make.centerY.equalTo(footerView)
                make.width.equalTo(34)
                make.height.equalTo(18)
            }
            return footerView
        }
        
        
        return UIView.init()
    }
    
    // 回复
    @objc func applyBtnClick(){
        let window = UIApplication.shared.keyWindow
        window?.addSubview(self.downBtn)
        self.downBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(window!)
        }
        self.downBtn.addSubview(self.downView)
        self.downBtn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.downView)
        }
        
        // 添加输入框
        self.downView.addSubview(self.textView)
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(downView).offset(12)
            make.right.equalTo(downView).offset(-12)
            make.top.equalTo(downView).offset(15)
            make.height.equalTo(215)
            
        }
        
        // 提交按钮
        self.downView.addSubview(self.commitBtn)
        commitBtn.snp.makeConstraints { (make) in
            make.left.equalTo(textView).offset(30)
            make.right.equalTo(textView).offset(-30)
            make.top.equalTo(textView.snp.bottom).offset(20)
            make.height.equalTo(38)
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.downView.transform = CGAffineTransform.init(translationX: 0, y: -325)
            
        }) { (finished) in
            
        }
        
    }
    @objc func commitBtnClick(){
        
    }
    
    @objc func downBtnClick() {
        UIView.animate(withDuration: 0.25, animations: {
            self.downView.transform = CGAffineTransform.identity
        }) { (finished) in
            self.downBtn.removeFromSuperview()
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 50
        }
        
        return 0.01
    }
    
}
