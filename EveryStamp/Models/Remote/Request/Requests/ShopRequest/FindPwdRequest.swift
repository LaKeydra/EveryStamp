//
//  FindPwdRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct FindPwdRequest: BaseRequest {
    typealias Response = FindPwdResponse
    var path: String {
        return "api/user/find_pwd"
    }
    
    var paramater: [String : Any]?
    
    init(time: Int, token: String, shoperName: Double, pwd: String, code: Double) {
        paramater = ["time": time, "token": token, "shoper_name": shoperName, "pwd": pwd, "code": code]
    }
}
