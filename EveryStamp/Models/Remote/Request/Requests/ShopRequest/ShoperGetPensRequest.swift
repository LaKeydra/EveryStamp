//
//  UserShoperGetPensRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserShoperGetPensRequest: BaseRequest {
    typealias Response = ShoperGetPensResponse
    
    var path: String {
        return "api/shoper/getpens"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shoper_id: Int) {
        paramater = ["access_token": access_token, "shoper_id": shoper_id]
    }
}
