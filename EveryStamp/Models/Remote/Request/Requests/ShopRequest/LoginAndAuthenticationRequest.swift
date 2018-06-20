//
//  LoginAndAuthenticationRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct LoginAndAuthenticationRequest: BaseRequest {
    typealias Response = LoginAndAuthenticationResponse
    var path: String {
        return "api/shoper/login"
    }

    var paramater: [String : Any]?
    
    init(time: String, token: String, shoperName: String, pwd: String) {
        paramater = ["time": time , "token": token, "shoper_name": shoperName,"pwd": pwd]
    }
    
}
