//
//  GSHallCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/12.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit
import SDCycleScrollView

class GSHallCell: UITableViewCell {

    lazy var cycleScrollView:SDCycleScrollView = {
        let cycleScrollView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 150), delegate: self, placeholderImage: UIImage.init(named: "meinv.jpg"))
        cycleScrollView?.pageDotColor = UIColor.cz_color(withHex: 0xFCD6AB)?.withAlphaComponent(0.3)
        cycleScrollView?.delegate = self
        cycleScrollView?.pageControlDotSize = CGSize.init(width: 5, height: 5)
        cycleScrollView?.currentPageDotColor = UIColor.cz_color(withHex: 0xFCD6AB)
        cycleScrollView?.imageURLStringsGroup = ["meinv.jpg","meinv.jpg","meinv.jpg","meinv.jpg","meinv.jpg"]
        return cycleScrollView!
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        // 轮播图
        addSubview(cycleScrollView)
       
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


extension GSHallCell:SDCycleScrollViewDelegate{
    @nonobjc func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print("点击" + "\(index)")
    }
}

