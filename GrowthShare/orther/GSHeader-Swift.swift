//
//  GSHeader-Swift.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/5.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import Foundation


let isIphoneX = UIScreen.cz_screenHeight() >= 812 ? true : false
let GSStatusHeight : CGFloat = isIphoneX ? 44.0 : 20.0
let GSNavBarHeight : CGFloat = isIphoneX ? 88 : 64
let GSTabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49


let GSFontColor = UIColor.cz_color(withHex: 0xAC9472)
