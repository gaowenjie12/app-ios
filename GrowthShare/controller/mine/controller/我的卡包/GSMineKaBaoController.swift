//
//  GSMineKaBaoController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSMineKaBaoController: GSBaseController {

    lazy var dataArray:NSMutableArray = {
        let dataArray = NSMutableArray.init()
        return dataArray
    }()
    
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSMineKaBaoCell.self, forCellReuseIdentifier: "GSMineKaBaoCell")
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "我的卡卷"
        
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.cz_color(withHex: 0xF2F2F2)
        self.view.backgroundColor = UIColor.cz_color(withHex: 0xF2F2F2)
        setupLayout()
    }
    
    
    func setupLayout() {
        
        self.setupItems()
    }
    func setupItems() {
        
        
        let rightItem = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 17))
        rightItem.setTitle("卡卷列表", for: .normal)
        rightItem.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        rightItem.setTitleColor(UIColor.cz_color(withHex: 0xAC9472), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightItem)
        rightItem.addTarget(self, action: #selector(setupRightItem), for: .touchUpInside)
        
    }
    
    // 卡卷列表
    @objc func setupRightItem(){
        
    }
    
}
extension GSMineKaBaoController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 146
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSMineKaBaoCell", for: indexPath) as! GSMineKaBaoCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(GSCaiGouKCController.init(), animated: true)
    }
    
    
}
