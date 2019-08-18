//
//  GSZhaoShangJMController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/13.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSZhaoShangJMController: GSBaseController {
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSWorthProductTVCell.self, forCellReuseIdentifier: "GSWorthProductTVCell")
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "招商加盟"
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        
    }
}
extension GSZhaoShangJMController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 127
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSWorthProductTVCell", for: indexPath) as! GSWorthProductTVCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let zsjmdetail = GSZSJMDetailController.init()
        zsjmdetail.title = "招商加盟详情页"

        self.navigationController?.pushViewController(zsjmdetail, animated: true)
    }

    
}
