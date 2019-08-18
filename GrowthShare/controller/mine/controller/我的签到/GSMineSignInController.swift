//
//  GSMineSignInController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/7.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMineSignInController: GSBaseController {

    lazy var dataArray:NSMutableArray = {
        let dataArray = NSMutableArray.init()
        return dataArray
    }()
    
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSMineSignTopCell.self, forCellReuseIdentifier: "GSMineSignTopCell")
        tableView.register(GSMineSignCenterCell.self, forCellReuseIdentifier: "GSMineSignCenterCell")
        tableView.register(GSMineSignDownCell.self, forCellReuseIdentifier: "GSMineSignDownCell")
        tableView.estimatedRowHeight = 500
        tableView.tableFooterView = UIView.init();

        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "我的签到"
        
        self.view.addSubview(self.tableView)

        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        setupLayout()
    }
    
    
    func setupLayout() {
        
        
    }
   

}
extension GSMineSignInController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 2 {
            return 2
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 103
        }else if indexPath.section == 1 {
            return UITableView.automaticDimension
        }else if indexPath.section == 2 {
            if indexPath.row == 0{
                return 96
            }else{
                return 110
            }
        }else if indexPath.section == 3 {
            return UITableView.automaticDimension
        }
        
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSMineSignTopCell", for: indexPath) as! GSMineSignTopCell
//            let model:LBSXSearchModel = searchDataArray[indexPath.row]
//            cell.model = model
            return cell
        }else if (indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSMineSignCenterCell", for: indexPath) as! GSMineSignCenterCell
            return cell
        }else if (indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSMineSignDownCell", for: indexPath) as! GSMineSignDownCell
            return cell
        }else if (indexPath.section == 3){
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSMineSignCenterCell", for: indexPath) as! GSMineSignCenterCell
            return cell
        }
        
        
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let model:LBSXSearchModel = self.searchDataArray[indexPath.row]
//
//        self.navigationController?.pushViewController(LBSXHomeDetaiProjectController.init(service: model.service_id ?? ""), animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0){
            return UIView.init()
        }else if (section == 1){
            
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 45))
            headerView.backgroundColor = UIColor.white
            let topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
            topView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            headerView.addSubview(topView)
            
            let titleLabel = UILabel.init()
            headerView.addSubview(titleLabel)
            titleLabel.text = "规则"
            titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(headerView.snp.left).offset(12)
                make.top.equalTo(topView.snp.bottom).offset(12)
            }
            
            return headerView
        }else if (section == 2){
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 45))
            headerView.backgroundColor = UIColor.white
            let topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
            topView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            headerView.addSubview(topView)
            
            let titleLabel = UILabel.init()
            headerView.addSubview(titleLabel)
            titleLabel.text = "我的排名劵"
            titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(headerView.snp.left).offset(12)
                make.top.equalTo(topView.snp.bottom).offset(12)
            }
            
            return headerView
        }else if (section == 3){
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 45))
            headerView.backgroundColor = UIColor.white
            let topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
            topView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            headerView.addSubview(topView)
            
            let titleLabel = UILabel.init()
            headerView.addSubview(titleLabel)
            titleLabel.text = "排名劵规则"
            titleLabel.textColor = UIColor.cz_color(withHex: 0x222222)
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(headerView.snp.left).offset(12)
                make.top.equalTo(topView.snp.bottom).offset(12)
            }
            
            return headerView
        }
        return UIView.init()
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0){
            return 0.01
        }else if (section == 1 || section == 2 || section == 3){
            return 45
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
