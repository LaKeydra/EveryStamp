//
//  ChangePwdRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct ChangePwdRequest: BaseRequest {
    typealias Response = ChangePwdResponse
    var path: String {
        return "api/shoper/change_pwd"
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, shoperId: Double,iniPwd: String, pwd: String) {
        paramater = ["access_token": accessToken , "shoper_id": shoperId, "ini_pwd": iniPwd,"pwd": pwd]
    }
}
