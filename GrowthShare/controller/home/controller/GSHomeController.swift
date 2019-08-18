//
//  GSHomeController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/5.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHomeController: GSBaseController {
    
    
    private lazy var citySelectButton:WYButton = {
        let citySelectButton = WYButton.init(buttonFrame: CGRect.init(x: 0, y: 0, width: 63, height: 21), imgViewSize: CGSize.init(width: 21, height: 21), titleLabel: CGSize.init(width: 42, height: 21), layoutStyle: .ImgViewRightTitleLabell, layoutSpace: 0)
        citySelectButton?.setTitle("全国", for: .normal)
        citySelectButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        citySelectButton?.setTitleColor(UIColor.cz_color(withHex: 0x222222), for: .normal)
        citySelectButton?.setImage(UIImage.init(named: "home_xiajiantou"), for: .normal)
        citySelectButton?.addTarget(self, action: #selector(setupLeftItem(button:)), for: .touchUpInside)

        return citySelectButton!
    }()
    
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSHomeCell.self, forCellReuseIdentifier: "GSHomeCell")
        tableView.register(GSWorthProductTVCell.self, forCellReuseIdentifier: "GSWorthProductTVCell")
        tableView.register(GSCaiGouTVCell.self, forCellReuseIdentifier: "GSCaiGouTVCell")

        
        tableView.tableFooterView = UIView.init();
        
        return tableView
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
        // 1.
        setupItems()
        // 2.
        setupSearch()
    }
    
    func setupSearch() {
        
        
        let titleView = UIBarTitleView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth() - 93 - 52, height: 30))
        titleView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        titleView.layer.cornerRadius = 15
        titleView.layer.masksToBounds = true
        
        let search = UITextField.init()
        search.placeholder = "请输入要搜索的内容";
        search.backgroundColor = UIColor.clear;
        search.layer.cornerRadius = 15;
        search.layer.masksToBounds = true;
        titleView.addSubview(search)
        search.snp.makeConstraints { (make) in
            make.edges.equalTo(titleView)
            make.height.equalTo(30)
        }
        search.setValue(UIColor.cz_color(withHex: 0xDADADA), forKeyPath: "_placeholderLabel.textColor")
        search.setValue(UIFont.systemFont(ofSize: 14), forKeyPath: "_placeholderLabel.font")
        let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 35, height: 30))
        search.leftView = downView;
        search.leftViewMode = .always;
        let imageV = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
        imageV.image = UIImage.init(named: "home_search");
        imageV.backgroundColor = UIColor.clear
        downView.addSubview(imageV)
        imageV.snp.makeConstraints { (make) in
            make.center.equalTo(downView)
        }

        navigationItem.titleView = titleView
        let searchBtn = UIButton.init()
        titleView.addSubview(searchBtn)
        searchBtn.backgroundColor = UIColor.clear
        searchBtn.layer.cornerRadius = 15;
        searchBtn.layer.masksToBounds = true;
        searchBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(titleView)
            make.height.equalTo(30);
        }
        searchBtn.addTarget(self, action: #selector(searchBtnClick), for: .touchUpInside)
    }
    @objc func searchBtnClick(){
        self.navigationController?.pushViewController(GSSearchController.init(), animated: true)

    }
    func setupItems() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: self.citySelectButton)
        
        let rightItem = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 17, height: 17))
        rightItem.setImage(UIImage.init(named: "home_xiaoxi"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightItem)
        rightItem.addTarget(self, action: #selector(setupRightItem), for: .touchUpInside)
    }
    
    @objc func setupLeftItem(button:UIButton){
    
        let citySelecteVC = WYCitySelectViewController.init()
        citySelecteVC.tintColor = UIColor.orange // 分区索引及搜索关键字的颜色
        citySelecteVC.block = {cityName in
            
            button.setTitle(cityName, for: .normal)
        }
    
        self.present(GSNavController(rootViewController: citySelecteVC), animated: true, completion: nil)
        
    }
    
    @objc func setupRightItem(){
        self.navigationController?.pushViewController(GSHomeMessageController.init(), animated: true)
    }
    
    
    @objc func setupLogin()  {
        
        
//        let login = GSNavController.init(rootViewController: GSLoginController.init())
        
        self.navigationController?.pushViewController(GSLoginController.init(), animated: true)
        
    }
   

}
extension GSHomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else if section == 1{
            return 3
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
            return 149 + 92 + 50
        }else if indexPath.section == 1{
            return 120
        }else if indexPath.section == 2{
            return 145
        }else if indexPath.section == 3{
            return 145
        }else if indexPath.section == 4{
            return 120
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSHomeCell", for: indexPath) as! GSHomeCell
            cell.callBackBlock { (index) in
                if index == 0{ //库存采购
                    self.navigationController?.pushViewController(GSCaiGouKCController.init(), animated: true)

                }else if index == 1{ // 价值产品
                    self.navigationController?.pushViewController(GSJiaZhiCPController.init(), animated: true)

                }else if index == 2{ // 招商加盟
                    self.navigationController?.pushViewController(GSZhaoShangJMController.init(), animated: true)
                }else if index == 3{ // 贷款融资
                    
                    let dkrz = GSDaiKuanRZController.init(titles: ["银行信贷","融资项目"], vcs: [GSRankXDController(),GSRZProjectController()], pageStyle: .navgationBarSegment)
                    self.navigationController?.pushViewController(dkrz, animated: true)

                }
                
            }
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSWorthProductTVCell", for: indexPath) as! GSWorthProductTVCell
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSCaiGouTVCell", for: indexPath) as! GSCaiGouTVCell
            cell.titleLabel.text = "采购&库存"
            return cell
        }else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSCaiGouTVCell", for: indexPath) as! GSCaiGouTVCell
            cell.titleLabel.text = "价值产品"
            return cell
        }
        else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSWorthProductTVCell", for: indexPath) as! GSWorthProductTVCell
            return cell
        }
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 { // 推广活动
            self.navigationController?.pushViewController(GSJLHDetailYouController.init(), animated: true)
        }else if indexPath.section == 2 { // 采购&库存
            self.navigationController?.pushViewController(GSCaiGouKCController.init(), animated: true)
        }else if indexPath.section == 4 { // 招商加盟
            self.navigationController?.pushViewController(GSZSJMDetailController.init(), animated: true)
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var titleArr = ["","推广活动","采购&库存","价值产品","招商加盟"]
        
        if section == 1 || section == 2 || section == 3 || section == 4{
            
            
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
        
        if button.tag == 1 { // 推广活动
            self.navigationController?.pushViewController(GSJLHYuGaoController.init(), animated: true)

        }else if button.tag == 2 { // 采购&库存
            self.navigationController?.pushViewController(GSCaiGouKCController.init(), animated: true)

        }else if button.tag == 3 { // 价值产品
            self.navigationController?.pushViewController(GSJiaZhiCPController.init(), animated: true)

        } else if button.tag == 4 { // 招商加盟
            self.navigationController?.pushViewController(GSZhaoShangJMController.init(), animated: true)

        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1 || section == 2 || section == 3 || section == 4{
            return 40
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 1 || section == 2 || section == 3 {
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
            downView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
            return downView
        }else if section == 4{
            let downView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 10))
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
            
            let subTitleLabel = UILabel.init()
            downView.addSubview(subTitleLabel)
            subTitleLabel.text = "亿企共享 版权所有"
            subTitleLabel.textColor = UIColor.cz_color(withHex: 0xDADADA)
            subTitleLabel.font = UIFont.systemFont(ofSize: 13)
            subTitleLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(downView)
                make.top.equalTo(titleLabel.snp.bottom).offset(7)
            }
            return downView
        }
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 || section == 2 || section == 3 {
            return 10
        }else if section == 4 {
            return 115
        }
        return 0.01
    }
    
    
}


extension GSHomeController:UISearchBarDelegate{
    
}
