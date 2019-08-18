//
//  GSHYJQDTController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHangYJQDTController: GSBaseController {

    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSHYJQDTCell.self, forCellReuseIdentifier: "GSHYJQDTCell")
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "近期动态"
        // 3.
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.tableView.backgroundColor = UIColor.white
        
    }
}
extension GSHangYJQDTController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 118
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSHYJQDTCell", for: indexPath) as! GSHYJQDTCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let jiaZhiCP = GSHYJQDTDetailController.init()
        self.navigationController?.pushViewController(jiaZhiCP, animated: true)
    }
    
    
}
