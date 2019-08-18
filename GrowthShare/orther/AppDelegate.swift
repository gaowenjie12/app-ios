//
//  AppDelegate.swift
//  GrowthShare
//
//  Created by liubo on 2019/7/4.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // 1.管理键盘
        let manager = IQKeyboardManager.shared
        manager.enable = true
        manager.shouldResignOnTouchOutside = true
        manager.shouldToolbarUsesTextFieldTintColor = true
        manager.enableAutoToolbar = false
        // 2.
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
            UITableView.appearance().contentInsetAdjustmentBehavior = UITableView.ContentInsetAdjustmentBehavior.never
        }
        
        // 3.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white;
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = GSTabBarController()

        // 5.

        return true
    }

}

