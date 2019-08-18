//
//  GSXinXiangListController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/12.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSXinXiangListController: GSBaseController {
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSXinXiangListCell.self, forCellReuseIdentifier: "GSXinXiangListCell")
        tableView.tableFooterView = UIView.init();
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
        
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        
    }
    
    @objc func setupLogin()  {
        
        
        //        let login = GSNavController.init(rootViewController: GSLoginController.init())
        
        self.navigationController?.pushViewController(GSLoginController.init(), animated: true)
        
    }
    
    
}
extension GSXinXiangListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSXinXiangListCell", for: indexPath) as! GSXinXiangListCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
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
}
