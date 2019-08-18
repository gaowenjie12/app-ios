//
//  NetWork.swift
//  GrowthShare
//
//  Created by liubo on 2019/7/22.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit
import Alamofire

class NetWork{

    class func requestData(type:HTTPMethod = .get,URLString:String,parameters:[String:String]? = nil,finishedCallback:@escaping (_ result:AnyObject)->()){
        
        let headers:HTTPHeaders = [:]
        
        Alamofire.request(URLString, method: type, parameters: parameters).responseJSON { (response) in

//        Alamofire.request(URLString, method: type, parameters: parameters,encoding: JSONEncoding.default,headers: headers).responseJSON { (response) in
        
            guard let result = response.result.value else{
                print(response.result.error)
                return
            }
            print(response.result.isSuccess)
            print(response.result.isFailure)
            
            finishedCallback(result as AnyObject)
        }
        
    }
    
}
