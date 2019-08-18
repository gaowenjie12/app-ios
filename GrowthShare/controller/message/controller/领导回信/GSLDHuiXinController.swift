//
//  GSLDHuiXinController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSLDHuiXinController: GSBaseController {

    
    
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSLDHuiXinCell.self, forCellReuseIdentifier: "GSLDHuiXinCell")
        tableView.tableFooterView = UIView.init();
        tableView.estimatedRowHeight = 500
        tableView.tableHeaderView = setupHeaderView()
        
        return tableView
    }()
    
    private lazy var searchBar: UITextField = {
        let searchBar = UITextField()
        searchBar.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        searchBar.textColor = UIColor.cz_color(withHex: 0xDADADA)
        searchBar.tintColor = UIColor.darkGray
        searchBar.font = UIFont.systemFont(ofSize: 13)
        searchBar.placeholder = "请输入要搜索的内容"
        searchBar.layer.cornerRadius = 15
        
        searchBar.clearsOnBeginEditing = true
        searchBar.clearButtonMode = .whileEditing
        searchBar.returnKeyType = .search
        //        searchBar.delegate = self
        return searchBar
    }()
    func setupHeaderView() -> UIView{
        
        let imageView = UIImageView.init(image: UIImage.init(named: "home_search"))
        //        imageView.backgroundColor = UIColor.red
        let searchView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 37, height: 30))
        searchView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.width.height.equalTo(15)
            make.center.equalTo(searchView)
        })
        
        searchBar.leftView = searchView
        searchBar.leftViewMode = .always
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 52))
        
        headerView.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.top.equalTo(15)
            make.right.equalTo(-12)
            make.height.equalTo(30)
        }
        
        return headerView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.title = "领导回信"
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        
    }
}
extension GSLDHuiXinController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSLDHuiXinCell", for: indexPath) as! GSLDHuiXinCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(GSLDHXDetailController.init(), animated: true)
    }
    
    
}
