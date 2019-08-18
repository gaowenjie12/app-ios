//
//  GSSearchChildController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/13.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSSearchChildController: GSBaseController {
    lazy var collectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: UIScreen.cz_screenWidth() / 4.0, height: 35)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - GSNavBarHeight - 44), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
        collectionView.register(GSSearchChildCell.self, forCellWithReuseIdentifier:"GSSearchChildCell")
        collectionView.register(GSSearchChildHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "GSSearchChildHeaderView")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
    }

}


extension GSSearchChildController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GSSearchChildCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GSSearchChildCell", for: indexPath) as! GSSearchChildCell
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
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview:UICollectionReusableView?
        
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0{
                let mineHeaderView:GSSearchChildHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "GSSearchChildHeaderView", for: indexPath) as! GSSearchChildHeaderView
                mineHeaderView.backgroundColor = UIColor.clear
                mineHeaderView.titleLabel.text = "历史搜索"
                mineHeaderView.deleteBtn.isHidden = false

                mineHeaderView.callBackBlock {
                    self.navigationController?.pushViewController(GSMineSignInController.init(), animated: true)
                }
                reusableview = mineHeaderView
                
            }else if indexPath.section == 1{
                let mineHeaderView:GSSearchChildHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "GSSearchChildHeaderView", for: indexPath) as! GSSearchChildHeaderView
                mineHeaderView.backgroundColor = UIColor.clear
                mineHeaderView.titleLabel.text = "热门搜索"
                mineHeaderView.deleteBtn.isHidden = true

                mineHeaderView.callBackBlock {
                    self.navigationController?.pushViewController(GSMineSignInController.init(), animated: true)
                }
                reusableview = mineHeaderView
                
            }
            
        }
        return reusableview!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize.init(width: UIScreen.cz_screenWidth(), height: 50)
        
    }

}

extension GSSearchChildController:ZJScrollPageViewChildVcDelegate{
    
}
