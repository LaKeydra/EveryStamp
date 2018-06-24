//
//  UserRegisterRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserRegisterRequest: BaseRequest {
    
    typealias Response = UserRegisterResponse
    
    var path: String {
        return "api/app/register"
    }
    
    var paramater: [String : Any]?
    
    init(time: String, token: String, userName: String, pwd: String, code: Int, from: String) {
        paramater = ["time": time , "token": token, "user_name": userName,"pwd": pwd,"code": code, "from": from]
    }
    
}
