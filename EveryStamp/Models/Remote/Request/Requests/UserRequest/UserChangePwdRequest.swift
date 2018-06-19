//
//  UserChangePwdRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserChangePwdRequest: BaseRequest {
    typealias Response = UserChangePwdResponse
    var path: String {
        return "api/user/changepwd"
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, userId: Double,iniPwd: String, pwd: String) {
        paramater = ["access_token": accessToken , "user_id": userId, "ini_pwd": iniPwd,"pwd": pwd]
    }
}
