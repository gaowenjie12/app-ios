//
//  GSLDContactListController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSLDContactListController: GSBaseController {

    
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSLDContactListCell.self, forCellReuseIdentifier: "GSLDContactListCell")
        tableView.tableFooterView = UIView.init();
        
        tableView.tableHeaderView = setupHeaderView()
        
        return tableView
    }()
    
    
    func setupHeaderView() -> UIView{
        
       
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 32))
        headerView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)

        let label = UILabel.init()
        label.textColor = UIColor.cz_color(withHex: 0x979797)
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = "好友需要在本平台注册才能私信哦~"
        headerView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(headerView)
            make.left.equalTo(headerView).offset(12)
        }
        
        
        let deleteLabel = UILabel.init()
        deleteLabel.textColor = UIColor.cz_color(withHex: 0x979797)
        deleteLabel.font = UIFont.systemFont(ofSize: 11)
        deleteLabel.text = "×"
        headerView.addSubview(deleteLabel)
        deleteLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(label)
            make.right.equalTo(headerView).offset(-12)
        }
        
        return headerView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "聊天列表"
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        self.setupItems()
    }
    func setupItems() {
        
        
        let rightItem = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 17))
        rightItem.setTitle("好友列表", for: .normal)
        rightItem.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        rightItem.setTitleColor(UIColor.cz_color(withHex: 0x222222), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightItem)
        rightItem.addTarget(self, action: #selector(setupRightItem), for: .touchUpInside)
        
    }
    
    // 好友列表
    @objc func setupRightItem(){
        
    }
}
extension GSLDContactListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSLDContactListCell", for: indexPath) as! GSLDContactListCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let contact = GSLDContactController.init()
        self.navigationController?.pushViewController(contact, animated: true)
    }
    
    
}
