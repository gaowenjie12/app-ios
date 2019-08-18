//
//  GSHYSection1Cell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/17.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSHYSection1Cell: UITableViewCell {

    private var displayView: TLDisplayView = {
        let displayView = TLDisplayView.init()
        displayView.font = UIFont.systemFont(ofSize: 13)
        displayView.textColor = UIColor.cz_color(withHex: 0x222222)
        displayView.setText("智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。 智能家居通过物联网技术将家中的各种设备连接到一起，提供家电控制、照明控制、电话远程控智能家居是在互联网影响之下物联化的体现。")
        displayView.numberOfLines = 6
        displayView.setOpen(" 详情", close: " 收起", font: UIFont.systemFont(ofSize: 13), textColor: UIColor.cz_color(withHex: 0xAC9472))
        
        displayView.backgroundColor = UIColor.white
        return displayView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.contentView.addSubview(self.displayView)
        self.displayView.delegate = self
        let size0 = displayView.sizeThatFits(CGSize.init(width: UIScreen.cz_screenWidth() - 24, height: CGFloat(MAXFLOAT)))
        displayView.frame = CGRect.init(x: 12, y: 10, width: size0.width, height: size0.height)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model:GSMineSignModel? {
        didSet {
            guard let model = model else {return}
            // self.titleLabel.text = model.service_name
        }
    }
    
}

extension GSHYSection1Cell:TLDisplayViewDelegate{
    func displayView(_ label: TLDisplayView!, openHeight height: CGFloat) {
        
        var frame = self.displayView.frame
        frame.size.height = height
        self.displayView.frame = frame
        
//        self.view.layoutIfNeeded()
        
//        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 40)
        
    }
    
    func displayView(_ label: TLDisplayView!, closeHeight height: CGFloat) {
        
        var frame = self.displayView.frame
        frame.size.height = height
        self.displayView.frame = frame
        
//        self.view.layoutIfNeeded()
        
//        self.scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth(), height: top3View.frame.maxY + 40)
        
    }
}

