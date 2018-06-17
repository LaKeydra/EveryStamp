//
//  RefreshAccessCredentialsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct RefreshAccessCredentialsRequest: BaseRequest {
    typealias Response = RefreshAccessCredentialsResponse
    var path: String {
        return "api/shoper/update_token"
    }
    
    var paramater: [String : Any]?
    
    init(time: String, token: String, shoperId: Double, updateToken: String) {
        paramater = ["time": time , "token": token, "shoper_id": shoperId,"update_token": updateToken]
    }
}
