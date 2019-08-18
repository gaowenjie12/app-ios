//
//  GSHYLSController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/17.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHYLSController: GSBaseController {
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSHYSection1Cell.self, forCellReuseIdentifier: "GSHYSection1Cell")
        tableView.register(GSHYSection2Cell.self, forCellReuseIdentifier: "GSHYSection2Cell")
        tableView.register(GSHYSection3Cell.self, forCellReuseIdentifier: "GSHYSection3Cell")
        
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "零售"
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        
        
    }
    
    
    @objc func setupLogin()  {
        
        
        //        let login = GSNavController.init(rootViewController: GSLoginController.init())
        
        self.navigationController?.pushViewController(GSLoginController.init(), animated: true)
        
    }
    
    
}
extension GSHYLSController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else if section == 1{
            return 3
        }else if section == 2{
            return 3
        }
        
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
//            return 160
            return 140
        }else if indexPath.section == 1{
            return 89
        }else if indexPath.section == 2{
            return 81
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHYSection1Cell", for: indexPath) as! GSHYSection1Cell
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHYSection2Cell", for: indexPath) as! GSHYSection2Cell
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHYSection3Cell", for: indexPath) as! GSHYSection3Cell
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            self.navigationController?.pushViewController(GSCompanyJJController.init(), animated: true)
        }else if indexPath.section == 2{
            self.navigationController?.pushViewController(GSJiaZhiCPDetailController.init(), animated: true)

        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var titleArr = ["行业简介","热门企业","热门产品"]
            
        let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 40))
        let lineView = UIView.init()
        downView.addSubview(lineView)
        lineView.backgroundColor = UIColor.cz_color(withHex: 0x1C2D50)
        lineView.snp.makeConstraints { (make) in
            make.height.equalTo(15)
            make.width.equalTo(3)
            make.left.equalTo(12)
            make.centerY.equalTo(downView)
        }
        
        let titleLabel = UILabel.init()
        downView.addSubview(titleLabel)
        titleLabel.text = titleArr[section]
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(lineView.snp.right).offset(10)
            make.centerY.equalTo(downView)
        }
        let moreBtn = UIButton.init()
        moreBtn.setTitle("更多", for: .normal)
        if section == 0{
            moreBtn.isHidden = true
        }else{
            moreBtn.isHidden = false
        }
        moreBtn.tag = section
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        moreBtn.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        moreBtn.titleLabel?.textAlignment = .center
        downView.addSubview(moreBtn)
        moreBtn.addTarget(self, action: #selector(moreBtnClick(button:)), for: .touchUpInside)
        moreBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(downView)
            make.right.equalTo(-12)
            make.top.bottom.equalTo(downView)
            make.width.equalTo(30)
        }
        return downView
        
    }
    
    @objc func moreBtnClick(button:UIButton) {
        print(button.tag)
        if button.tag == 1 {
            self.navigationController?.pushViewController(GSHYQYListController.init(), animated: true)

        }else if button.tag == 2 {
            self.navigationController?.pushViewController(GSJiaZhiCPController.init(), animated: true)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 0 || section == 1 {
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
            downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            
            return downView
        }
        return UIView.init()
    }
    
    @objc func topBtnClick() {
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            
            return 10
        }
        return 0.01
    }
    
    
}
