//
//  GSHYDKListController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHYDKListController: GSBaseController {
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSHYDKListCell.self, forCellReuseIdentifier: "GSHYDKListCell")
        tableView.tableFooterView = UIView.init();
                
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "行业大咖"
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        
    }
}
extension GSHYDKListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSHYDKListCell", for: indexPath) as! GSHYDKListCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let jiaZhiCP = GSHYPersonJJController.init()
        jiaZhiCP.title = "人物简介"
        self.navigationController?.pushViewController(jiaZhiCP, animated: true)
    }
    
    
}
