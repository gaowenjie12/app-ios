
//
//  GSProductIntroduceController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/9.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSProductIntroduceController: GSBaseController {

    
    lazy var dataArray:NSMutableArray = {
        let dataArray = NSMutableArray.init()
        return dataArray
    }()
    
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSProductIntroduceCell.self, forCellReuseIdentifier: "GSProductIntroduceCell")
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "产品介绍"
        
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
extension GSProductIntroduceController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 11
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 89
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSProductIntroduceCell", for: indexPath) as! GSProductIntroduceCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}
