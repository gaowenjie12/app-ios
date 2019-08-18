//
//  GSTabBarController.swift
//  GrowthShare
//
//  Created by liubo on 2019/7/23.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit
import Alamofire

class GSTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Alamofire.request("http://httpbin.org/get", method: .get, parameters: nil, encoding: ParameterEncoding, headers: <#T##HTTPHeaders?#>)
        
        addChildViewControllers()
        
    }
    
    func addChildViewControllers() {
        
        // 1.首页
        addChildViewController(childController: GSHomeController.init(), normalImage:  "tab_shouye_pre", selectImage: "tab_shouye", title: "首页")
        // 2.展厅
        addChildViewController(childController: GSHallController.init(), normalImage: "tab_zhanting_pre", selectImage: "tab_zhanting", title: "展厅")
        // 3.消息
        addChildViewController(childController: GSMessageController.init(), normalImage: "tab_xiaoxi_pre", selectImage: "tab_xiaoxi", title: "消息")
        // 4.关注
        addChildViewController(childController: GSFollowController.init(), normalImage: "tab_guanzhu_pre", selectImage: "tab_guanzhu", title: "关注")
        // 5.我的
        addChildViewController(childController: GSMineController.init(), normalImage: "tab_wode_pre", selectImage: "tab_wode", title: "我的")
    }
    // 添加子控制器
    func addChildViewController(childController:UIViewController,normalImage:String,selectImage:String,title:String){
        childController.tabBarItem.image = UIImage.init(named: normalImage)
        let selectImage = UIImage(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = selectImage
        
        childController.title = title;
        
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.cz_color(withHex: 0xCCCCCC) as Any], for: UIControl.State.normal)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.cz_color(withHex: 0x1c2d50) as Any], for: UIControl.State.selected)
        
        self.addChild(GSNavController.init(rootViewController: childController))
    }
    
}
