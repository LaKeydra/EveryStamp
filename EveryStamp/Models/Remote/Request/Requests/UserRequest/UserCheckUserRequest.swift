//
//  UserCheckUserRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserCheckUserRequest: BaseRequest {
    typealias Response = UserCheckUserResponse
    
    var path: String {
        return "api/system/checkuser"
    }
    
    var paramater: [String : Any]?

    init(time: String, token: String, phone: String) {
        paramater = ["time": time, "token": token, "phone": phone]
    }
}
