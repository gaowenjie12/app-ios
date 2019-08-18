//
//  GSUserAgreeController.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/7.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSUserAgreeController: GSBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "用户服务协议"
        
        
        let webview = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - GSTabBarHeight))
        
        guard let url = URL.init(string: "http://pay.tpi.cntaiping.com/weshop/dft/agent/0382050000002000570004/YJ01/index") else {
            return
        }
        
        webview.loadRequest(URLRequest.init(url: url))
        self.view.addSubview(webview)
        
        
    }
    

    

}
