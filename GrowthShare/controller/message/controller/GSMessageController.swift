//
//  GSMessageController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/5.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMessageController: GSBaseController {
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSMessageCell.self, forCellReuseIdentifier: "GSMessageCell")
        
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    
    private lazy var dataArray:NSMutableArray = {
       
        let dataArray = NSMutableArray()
        return dataArray
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataArray = [[["image":"tongzhi_xiaoxi","title":"消息提醒"],["image":"tongzhi_xitonggonggao","title":"系统公告"],["image":"tongzhi_hangyezixun","title":"行业资讯"],["image":"tongzhi_lingdaohuixin","title":"领导回信"]],[["image":"hudong_liaotianliebiao","title":"聊天列表"]]]

        
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(-GSTabBarHeight)
        }
        self.tableView.backgroundColor = UIColor.white
        self.setupItems()
    }
    func setupItems() {
        
        
        let rightItem = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 17, height: 17))
        rightItem.setImage(UIImage.init(named: "tianjia"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightItem)
        rightItem.addTarget(self, action: #selector(setupRightItem), for: .touchUpInside)
        
        let rightItem2 = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 17, height: 17))
        rightItem2.setImage(UIImage.init(named: "tongxunlu"), for: .normal)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem.init(customView: rightItem),UIBarButtonItem.init(customView: rightItem2)]
        rightItem2.addTarget(self, action: #selector(setupRightItem2), for: .touchUpInside)
        
    }
    
    // 添加好友
    @objc func setupRightItem(){
        self.navigationController?.pushViewController(GSAddFriendsController.init(), animated: true)
    }
    // 通讯录
    @objc func setupRightItem2(){
        LJContactManager.sharedInstance()?.selectContact(at: self, complection: { (name, iphone) in
            print(name,iphone)
        })
    }
}
extension GSMessageController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 4
        }else if section == 1{
            return 1
        }
        
        
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 50
        }else if indexPath.section == 1{
            return 50
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSMessageCell", for: indexPath) as! GSMessageCell
        
        let array = self.dataArray[indexPath.section] as! [[String:String]]
        
        cell.dic = array[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            if indexPath.row == 0{
                self.navigationController?.pushViewController(GSHomeMessageController.init(), animated: true)
            }else if indexPath.row == 1{
                self.navigationController?.pushViewController(GSHangYJQDTController.init(), animated: true)
            }else if indexPath.row == 2{
                self.navigationController?.pushViewController(GSHangYJQDTController.init(), animated: true)
            }else if indexPath.row == 3{
                self.navigationController?.pushViewController(GSLDHuiXinController.init(), animated: true)
            }
        }else if indexPath.section == 1{

            self.navigationController?.pushViewController(GSLDContactListController.init(), animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var titleArr = ["通知","互动"]
        
        if section == 0 || section == 1 {
            
            
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: section == 1 ? 50 : 70))
            
            let titleLabel = UILabel.init()
            downView.addSubview(titleLabel)
            titleLabel.text = titleArr[section]
            titleLabel.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
            titleLabel.font = UIFont.systemFont(ofSize: 15)
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(downView).offset(12)
                make.bottom.equalTo(downView).offset(-10)
            }
            
            return downView
        }
        
        return UIView.init()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 50
        }else if section == 1{
            return 70
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        return 0.01
    }
    
    
}
