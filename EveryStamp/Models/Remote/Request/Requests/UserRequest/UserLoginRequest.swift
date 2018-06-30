//
//  UserLoginRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/13.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserLoginRequest: BaseRequest {
    
    typealias Response = UserLoginResponse
    
    var path: String {
        return "/api/app/login"
    }
    
    var paramater: [String : Any]?
    
    init(time: String, token: String, userName: String, pwd: String, from: String) {
        paramater = ["time": time , "token": token, "user_name": userName,"pwd": pwd.MD5(), "from": from]
    }
    
}
