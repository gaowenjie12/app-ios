//
//  GSFollowFenHuiController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/12.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSFollowFenHuiController: GSBaseController {
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSFenhuiSection1Cell.self, forCellReuseIdentifier: "GSFenhuiSection1Cell")
        tableView.register(GSFenhuiSection2Cell.self, forCellReuseIdentifier: "GSFenhuiSection2Cell")
        tableView.register(GSFenhuiSection3Cell.self, forCellReuseIdentifier: "GSFenhuiSection3Cell")
        tableView.tableFooterView = UIView.init();
        tableView.estimatedRowHeight = 500
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(3)
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
extension GSFollowFenHuiController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 150
        }else if indexPath.section == 1{
            return 80
        }else if indexPath.section == 2{
            return UITableView.automaticDimension
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSFenhuiSection1Cell", for: indexPath) as! GSFenhuiSection1Cell
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSFenhuiSection2Cell", for: indexPath) as! GSFenhuiSection2Cell
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSFenhuiSection3Cell", for: indexPath) as! GSFenhuiSection3Cell
            return cell
        }
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1{
            
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 40))
            let lineView = UIView.init()
            downView.addSubview(lineView)
            lineView.backgroundColor = UIColor.cz_color(withHex: 0xDADADA)
            lineView.snp.makeConstraints { (make) in
                make.height.equalTo(1)
                make.width.equalTo(253)
                make.centerX.equalTo(downView)
                make.top.equalTo(25)
            }
            
            let titleLabel = UILabel.init()
            downView.addSubview(titleLabel)
            titleLabel.backgroundColor = UIColor.white
            titleLabel.text = "分会相册"
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.systemFont(ofSize: 15)
            titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
            titleLabel.snp.makeConstraints { (make) in
                make.width.equalTo(90)
                make.center.equalTo(lineView)
            }
            
            
            return downView
        }else if section == 2{
            
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 50))
            let titleLabel = UILabel.init()
            downView.addSubview(titleLabel)
            titleLabel.backgroundColor = UIColor.white
            titleLabel.text = "分会简介"
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.systemFont(ofSize: 15)
            titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(downView).offset(12)
                make.centerY.equalTo(downView)
            }
            
            let lineView = UIView.init()
            downView.addSubview(lineView)
            lineView.backgroundColor = UIColor.cz_color(withHex: 0xF5F5F5)
            lineView.snp.makeConstraints { (make) in
                make.left.right.bottom.equalTo(downView)
                make.height.equalTo(1)
            }
            
            return downView
        }
        
        return UIView.init()
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1{
            return 40
        }else if section == 2{
            return 50
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 0 || section == 1 {
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
            downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            
            return downView
        }
        return UIView.init()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 10
        }
        return 0.01
    }
    
    
}

extension GSFollowFenHuiController:ZJScrollPageViewChildVcDelegate{
    
}
