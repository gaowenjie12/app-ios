//
//  GSJLHFenLeiController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/18.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSJLHFenLeiController: GSBaseController {
    
    private  lazy var tableLeftView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSJLHFenLeiLeftCell.self, forCellReuseIdentifier: "GSJLHFenLeiLeftCell")
        tableView.tableFooterView = UIView.init();
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    
    
    private  lazy var tableRightView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GSJLHFenLeiRightCell.self, forCellReuseIdentifier: "GSJLHFenLeiRightCell")
        tableView.showsHorizontalScrollIndicator = false
        tableView.tableFooterView = UIView.init();
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "全部行业"

        // 左边的
        self.view.addSubview(self.tableLeftView)
        
        self.tableLeftView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0)
            make.width.equalTo(150)
        }
        self.tableLeftView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        
        
        // 右边的
        self.view.addSubview(self.tableRightView)
        
        self.tableRightView.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(0)
            make.left.equalTo(tableLeftView.snp.right)
        }
        self.tableRightView.backgroundColor = UIColor.white
        
    }
}
extension GSJLHFenLeiController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tableLeftView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSJLHFenLeiLeftCell", for: indexPath) as! GSJLHFenLeiLeftCell
            return cell
        }else if tableView == self.tableRightView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSJLHFenLeiRightCell", for: indexPath) as! GSJLHFenLeiRightCell
            return cell
        }

        return UITableViewCell.init()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView == self.tableRightView {
            let yuGao = GSJLHYuGaoController.init()
//            yuGao.yuGaoIndex = indexPath.row
            self.navigationController?.pushViewController(yuGao, animated: true)
        }
        
    }
    
    
}
