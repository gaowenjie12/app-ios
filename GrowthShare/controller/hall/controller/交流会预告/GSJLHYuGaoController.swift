//
//  GSJLHYuGaoController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSJLHYuGaoController: GSBaseController {
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSJLHYuGaoCell.self, forCellReuseIdentifier: "GSJLHYuGaoCell")
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    
    
    var yuGaoIndex = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "交流会预告"

        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        
    }
}
extension GSJLHYuGaoController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 119
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSJLHYuGaoCell", for: indexPath) as! GSJLHYuGaoCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if self.yuGaoIndex == 1{ // 有详情,没有成果
            self.navigationController?.pushViewController(GSJLHDetailWuController.init(), animated: true)
        }else if self.yuGaoIndex == 2{ // 有成果和详情
            self.navigationController?.pushViewController(GSJLHDetailYouController.init(), animated: true)

        }
        
    }
    
    
}
