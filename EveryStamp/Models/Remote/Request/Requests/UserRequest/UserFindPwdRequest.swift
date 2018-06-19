//
//  UserFindPwdRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserFindPwdRequest: BaseRequest {
    typealias Response = UserFindPwdResponse
    var path: String {
        return "api/app/findpwd"
    }
    
    var paramater: [String : Any]?
    
    init(time: Int, token: String, userName: Double, pwd: String, code: Double) {
        paramater = ["time": time, "token": token, "user_name": userName, "pwd": pwd, "code": code]
    }
}
