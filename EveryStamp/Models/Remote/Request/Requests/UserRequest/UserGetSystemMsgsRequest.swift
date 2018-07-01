//
//  UserGetSystemMsgsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetSystemMsgsRequest: BaseRequest {
    typealias Response = UserGetSystemMsgsResponse
    
    var path: String {
        return "api/user/getsystemmsgs"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, type: Int?) {
        paramater = ["access_token": access_token, "user_id": user_id, "type": type]
    }
}
