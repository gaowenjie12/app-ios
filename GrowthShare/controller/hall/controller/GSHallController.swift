//
//  GSHallController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/5.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHallController: GSBaseController {

    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSHallCell.self, forCellReuseIdentifier: "GSHallCell")
        tableView.register(GSHallSection1Cell.self, forCellReuseIdentifier: "GSHallSection1Cell")
        tableView.register(GSHallSection2Cell.self, forCellReuseIdentifier: "GSHallSection2Cell")
        tableView.register(GSHallSection3Cell.self, forCellReuseIdentifier: "GSHallSection3Cell")
        tableView.register(GSHallSection4Cell.self, forCellReuseIdentifier: "GSHallSection4Cell")


        
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    private lazy var searchButon: UIButton = {
        let searchButon = UIButton(type: .system)
        searchButon.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30)
        searchButon.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        searchButon.layer.cornerRadius = 15
        searchButon.setTitle("请输入要搜索的内容", for: .normal)
        searchButon.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        searchButon.setTitleColor(UIColor.cz_color(withHex: 0xDADADA), for: .normal)
        searchButon.setImage(UIImage(named: "home_search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButon.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        searchButon.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        searchButon.addTarget(self, action:#selector(searchButtonClick), for: .touchUpInside)
        return searchButon
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(-GSTabBarHeight)
        }
        self.tableView.backgroundColor = UIColor.white
        
        // 2.
        setupSearch()
    }
    
    func setupSearch() {
        
        
        navigationItem.titleView = searchButon
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil,
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil,
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    @objc func searchButtonClick(){
        self.navigationController?.pushViewController(GSSearchController.init(), animated: true)
        
    }
    
    @objc func setupLogin()  {
        
        
        //        let login = GSNavController.init(rootViewController: GSLoginController.init())
        
        self.navigationController?.pushViewController(GSLoginController.init(), animated: true)
        
    }
    
    
}
extension GSHallController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else if section == 1{
            return 1
        }else if section == 2{
            return 1
        }else if section == 3{
            return 1
        }else if section == 4{
            return 3
        }
        
        
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 150
        }else if indexPath.section == 1{
            return 266
        }else if indexPath.section == 2{
            return 125
        }else if indexPath.section == 3{
            return 150
        }else if indexPath.section == 4{
            return 130
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHallCell", for: indexPath) as! GSHallCell
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHallSection1Cell", for: indexPath) as! GSHallSection1Cell
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHallSection2Cell", for: indexPath) as! GSHallSection2Cell
            return cell
        }else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHallSection3Cell", for: indexPath) as! GSHallSection3Cell
            return cell
        }
        else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHallSection4Cell", for: indexPath) as! GSHallSection4Cell
            
            if indexPath.row == 0 {
                cell.titleLabel.text = "交流会分类"
            }else if indexPath.row == 1 {
                cell.titleLabel.text = "交流会预告"
            }else if indexPath.row == 2 {
                cell.titleLabel.text = "成果展示"
            }
            
            return cell
        }
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 4 {
            if indexPath.row == 2 || indexPath.row == 1{
                
                let yuGao = GSJLHYuGaoController.init()
                yuGao.yuGaoIndex = indexPath.row
                self.navigationController?.pushViewController(yuGao, animated: true)
            }else if indexPath.row == 0{
                self.navigationController?.pushViewController(GSJLHFenLeiController.init(), animated: true)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var titleArr = ["","","行业大咖","行业大梁","行业交流会"]
        
        if section == 2 || section == 3 || section == 4{
            
            
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
            if section == 4{
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
        
        return UIView.init()
    }
    
    @objc func moreBtnClick(button:UIButton) {
        print(button.tag)
        
        if button.tag == 2 { // 行业大咖
            self.navigationController?.pushViewController(GSHYDKListController.init(), animated: true)
        }else if button.tag == 3{ // 行业大梁
            self.navigationController?.pushViewController(GSHangYJQDTController.init(), animated: true)

        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 2 || section == 3 || section == 4{
            return 40
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 1 {
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 50))
            downView.backgroundColor = UIColor.white
            let topBtn = UIButton.init()
            downView.addSubview(topBtn)
            topBtn.snp.makeConstraints { (make) in
                make.top.equalTo(downView).offset(5)
                make.centerX.equalTo(downView)
            }
            topBtn.setTitle("更多行业", for: .normal)
            topBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            topBtn.setTitleColor(UIColor.cz_color(withHex: 0xDADADA), for: .normal)
            topBtn.setImage(UIImage.init(named: "xiajiantou"), for: .normal)
            topBtn.layout(with: .imageRight, andMargin: 6)
            topBtn.addTarget(self, action: #selector(topBtnClick), for: .touchUpInside)
            
            let bgView = UIView.init()
            bgView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            downView.addSubview(bgView)
            bgView.snp.makeConstraints { (make) in
                make.left.bottom.right.equalTo(downView)
                make.height.equalTo(10)
            }
            
            
            return downView
        }else if section == 2 || section == 3 {
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
            downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            return downView
        }else if section == 4{
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 98))
            downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            let titleLabel = UILabel.init()
            downView.addSubview(titleLabel)
            titleLabel.text = "没有更多啦~~"
            titleLabel.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
            titleLabel.font = UIFont.systemFont(ofSize: 13)
            titleLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(downView)
                make.top.equalTo(27)
            }
            
            return downView
        }
        return UIView.init()
    }
    
    @objc func topBtnClick() {
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }else if section == 2 || section == 3 {
            return 10
        }else if section == 4 {
            return 98
        }
        return 0.01
    }
    
    
}
