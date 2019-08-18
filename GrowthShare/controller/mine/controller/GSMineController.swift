//
//  GSMineController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/5.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit
import HandyJSON

class GSMineController: GSBaseController {

    lazy var collectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: UIScreen.cz_screenWidth() / 3.0, height: UIScreen.cz_screenWidth() / 3.0)
        
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - GSTabBarHeight - GSNavBarHeight), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(GSMineCell.self, forCellWithReuseIdentifier:"GSMineCell")
        collectionView.register(GSMineHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "GSMineHeaderView")
        return collectionView
    }()
    lazy var dataArray:NSMutableArray = {
        let dataArray = NSMutableArray()
        return dataArray;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        let product = ["image":"jiazhichanpin","title":"价值产品"]
        let meng = ["image":"zhaoshangjiameng","title":"招商加盟"]
        let kucun = ["image":"kucunweihuo","title":"库存尾货"]
        let rongzi = ["image":"daikuanrongzi","title":"贷款融资"]
        let hangye = ["image":"hangyezixun","title":"行业资讯"]
        let caigou = ["image":"caigou","title":"采购"]
        let company = ["image":"gongsirenzheng","title":"公司认证"]
        let xinxiang = ["image":"xinxiang","title":"信箱"]
        let tuiguang = ["image":"tuiguang","title":"推广"]
        let liuyanban = ["image":"liuyanban","title":"留言板"]
        let wode = ["image":"wode","title":"我的"]
        let shoucang = ["image":"shoucangnormal","title":"收藏"]
        let kabao = ["image":"kabao","title":"我的卡包"]
        let set = ["image":"shezhi","title":"设置"]
        let kefu = ["image":"lianxikefu","title":"联系客服"]
        let help = ["image":"bangzhu","title":"帮助中心"]

        self.dataArray.add(product)
        self.dataArray.add(meng)
        self.dataArray.add(kucun)
        self.dataArray.add(rongzi)
        self.dataArray.add(hangye)
        self.dataArray.add(caigou)
        self.dataArray.add(company)
        self.dataArray.add(xinxiang)
        self.dataArray.add(tuiguang)
        self.dataArray.add(liuyanban)
        self.dataArray.add(wode)
        self.dataArray.add(shoucang)
        self.dataArray.add(kabao)
        self.dataArray.add(set)
        self.dataArray.add(kefu)
        self.dataArray.add(help)

        
        self.view.addSubview(self.collectionView)
    }
    
    
}
extension GSMineController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GSMineCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GSMineCell", for: indexPath) as! GSMineCell
        cell.dic = self.dataArray[indexPath.row] as? [String:String]
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.cz_screenWidth() / 3, height: UIScreen.cz_screenWidth() / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview:UICollectionReusableView?
        
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0{
                let mineHeaderView:GSMineHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "GSMineHeaderView", for: indexPath) as! GSMineHeaderView
                mineHeaderView.backgroundColor = UIColor.clear
                mineHeaderView.callBackBlock {
                    self.navigationController?.pushViewController(GSMineSignInController.init(), animated: true)
                }
                reusableview = mineHeaderView
                
            }
            
        }
        return reusableview!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.init(width: UIScreen.cz_screenWidth(), height: 112)
        }
        return CGSize.zero
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if indexPath.row == 0{
            self.navigationController?.pushViewController(GSWorthProductController.init(), animated: true)
        }else if indexPath.row == 1{
            self.navigationController?.pushViewController(GSZhaoShangJMController.init(), animated: true)
        }else if indexPath.row == 2{ // 库存尾货
            self.navigationController?.pushViewController(GSCaiGouController.init(), animated: true)
        }else if indexPath.row == 3{
            self.navigationController?.pushViewController(GSDaiKuanRZController.init(), animated: true)
        }else if indexPath.row == 4{
            self.navigationController?.pushViewController(GSHangYJQDTController.init(), animated: true)
        }else if indexPath.row == 5{ // 采购
            self.navigationController?.pushViewController(GSCaiGouController.init(), animated: true)
        }else if indexPath.row == 6{ // 公司认证
            self.navigationController?.pushViewController(GSCompanyRZController.init(), animated: true)
        }else if indexPath.row == 7{
            self.navigationController?.pushViewController(GSLDHuiXinController.init(), animated: true)
        }else if indexPath.row == 8{
            self.navigationController?.pushViewController(GSJLHYuGaoController.init(), animated: true)
        }else if indexPath.row == 9{ // 留言板
            self.navigationController?.pushViewController(GSLDHuiXinController.init(), animated: true)
        }else if indexPath.row == 10{ // 我的
            self.navigationController?.pushViewController(GSMineCenterController.init(), animated: true)
        }else if indexPath.row == 11{ // 搜藏
            self.navigationController?.pushViewController(GSMineSCController.init(), animated: true)
        }else if indexPath.row == 12{ // 卡包
            self.navigationController?.pushViewController(GSMineKaBaoController.init(), animated: true)
        }else if indexPath.row == 13{ // 设置
            self.navigationController?.pushViewController(GSMineSetController.init(), animated: true)
        }else if indexPath.row == 14{ // 联系客服
//            self.navigationController?.pushViewController(GSHangYJQDTController.init(), animated: true)
        }else if indexPath.row == 15{ // 帮助中心
            self.navigationController?.pushViewController(GSHelpCenterController.init(), animated: true)
        }
    }
}

