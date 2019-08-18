//
//  GSLDHuiXinCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/19.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSLDHuiXinCell: UITableViewCell {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.cz_color(withHex: 0x333333)
        label.text = "部长回信"
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.cz_color(withHex: 0xB6B6B6)
        label.text = "北京中国国际展览中心新馆（简称新国展）----北京市规模最大、功能最为完善的展览中心，为展览行业量身订做，其功能达到..."
        label.numberOfLines = 2
        return label
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.cz_color(withHex: 0x979797)
        label.text = "2019-06-06"
        return label
    }()
    
    private var duLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.cz_color(withHex: 0xAC9472)
        label.text = "查看"
        return label
    }()
    
    private var lineView: UIView = {
        let lineView = UILabel()
        lineView.backgroundColor = UIColor.cz_color(withHex: 0xF4F4F4)
        return lineView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(self.contentView).offset(12)
        }
        
        self.contentView.addSubview(self.subTitleLabel)
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(titleLabel)
            make.right.equalTo(self.contentView).offset(-12)
        }
        self.contentView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(subTitleLabel)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(15)
        }
        
        self.contentView.addSubview(self.duLabel)
        self.duLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.centerY.equalTo(timeLabel)
        }
        
        self.contentView.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(1)
            make.right.equalTo(-12)
            make.left.equalTo(self.contentView).offset(12)
            make.top.equalTo(duLabel.snp.bottom).offset(15)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    var dic:[String:String]? {
    //        didSet {
    //            guard let dic = dic else {
    //                return
    //            }
    //            self.titleLabel.text = dic["title"]
    //            self.imageView.image = UIImage.init(named: dic["image"] ?? "")
    //        }
    //    }
}
