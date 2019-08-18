//
//  GSNetworkManager.swift
//  GrowthShare
//
//  Created by liubo on 2019/8/2.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit
import AFNetworking


enum GSHTTPMethod {
    case GET
    case POST
}
class GSNetworkManager: AFHTTPSessionManager {
    /// 静态区／常量／闭包
    /// 在第一次访问时，执行闭包，并且将结果保存在 shared 常量中
    static let shared: GSNetworkManager = {
        
        // 实例化对象
        let instance = GSNetworkManager()
        
        // 设置响应反序列化支持的数据类型
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        // 返回对象
        return instance
    }()
    
    
    // .GET .POST
    func request(method: GSHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool)->()) {
        
        // 成功回调
        let success = { (task: URLSessionDataTask, json: AnyObject?)->() in
            
            completion(json, true)
        }
        
        // 失败回调
        let failure = { (task: URLSessionDataTask?, error: NSError)->() in
            
            // error 通常比较吓人，例如编号：XXXX，错误原因一堆英文！
            print("网络请求错误 \(error)")
            
            completion(nil, false)
        }
        
//        if method == .GET {
//            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
//        } else {
//
//            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
//        }
    }
}
