//
//  GSRZProjectController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/15.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSRZProjectController: GSBaseController {

    lazy var collectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: (UIScreen.cz_screenWidth() - 30) / 2.0, height: 187)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
        collectionView.bounces = false
        collectionView.register(GSRZCollectionCell.self, forCellWithReuseIdentifier:"GSRZCollectionCell")
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-10)

        }

    }
    

}
extension GSRZProjectController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GSRZCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GSRZCollectionCell", for: indexPath) as! GSRZCollectionCell
        //  cell.dic = self.dataArray[indexPath.row] as? [String:String]
         return cell
    }
    
    // 每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    
    // 最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let rzdetail = GSRZProjectDetailController.init()
        rzdetail.title = "融资详情"
        self.navigationController?.pushViewController(rzdetail, animated: true)
    }
}

