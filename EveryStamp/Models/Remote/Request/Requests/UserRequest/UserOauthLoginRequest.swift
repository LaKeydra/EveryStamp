//
//  UserOauthLoginRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//
import Foundation

struct UserOauthLoginRequest: BaseRequest {
    typealias Response = UserOauthLoginResponse
    var path: String {
        return "api/app/oauthlogin"
    }
    
    var paramater: [String : Any]?
    
    init(time: String, token: String, openId: String, unionId: String, type: String) {
        paramater = ["time": time, "token": token, "open_id": openId, "union_id": unionId, "type": type]
    }
}
