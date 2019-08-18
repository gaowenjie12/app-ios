//
//  GSFollowJiaGouController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/12.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSFollowJiaGouController: GSBaseController {
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSJiaGouSection1Cell.self, forCellReuseIdentifier: "GSJiaGouSection1Cell")
        tableView.register(GSJiaGouSection2Cell.self, forCellReuseIdentifier: "GSJiaGouSection2Cell")
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
extension GSFollowJiaGouController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 150
        }else if indexPath.section == 1{
            return UITableView.automaticDimension
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSJiaGouSection1Cell", for: indexPath) as! GSJiaGouSection1Cell
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSJiaGouSection2Cell", for: indexPath) as! GSJiaGouSection2Cell
            return cell
        }
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1{
            
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
            downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            return downView
        }
        
        return UIView.init()
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1{
            return 10
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


extension GSFollowJiaGouController:ZJScrollPageViewChildVcDelegate{
    
}
