//
//  GSCaiGouTVCell.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/11.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSCaiGouTVCell: UITableViewCell {
    
    
    
    lazy var collectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: UIScreen.cz_screenWidth() / 3.0, height: 135)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal

        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 135), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false

        collectionView.register(GSCaiGouCollectionCell.self, forCellWithReuseIdentifier:"GSCaiGouCollectionCell")
        return collectionView
    }()
    lazy var dataArray:NSMutableArray = {
        let dataArray = NSMutableArray()
        return dataArray;
    }()
    
    public lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        return titleLabel;
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.addSubview(collectionView)
        
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
extension GSCaiGouTVCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GSCaiGouCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GSCaiGouCollectionCell", for: indexPath) as! GSCaiGouCollectionCell
//        cell.dic = self.dataArray[indexPath.row] as? [String:String]
        return cell
    }
    
    // 每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // 最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        
        if titleLabel.text == "采购&库存" {
            self.viewController()?.navigationController?.pushViewController(GSCaiGouKCController.init(), animated: true)

        }else if titleLabel.text == "价值产品" {
            self.viewController()?.navigationController?.pushViewController(GSJiaZhiCPDetailController.init(), animated: true)

        }
    }
}

