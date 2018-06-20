//
//  UserShoperGetShopsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserShoperGetShopsRequest: BaseRequest {
    typealias Response = ShoperGetShopsResponse
    
    var path: String {
        return "api/shoper/getshops"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shoper_id: Int) {
        paramater = ["access_token": access_token, "shoper_id": shoper_id]
    }
}
