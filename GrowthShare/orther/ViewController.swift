//
//  ViewController.swift
//  GrowthShare
//
//  Created by liubo on 2019/7/4.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetWork.requestData(type: .get, URLString: "", parameters: [:]) { (result) in
            
        }
        
    }


}

