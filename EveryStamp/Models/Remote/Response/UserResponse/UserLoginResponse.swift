//
//  UserLoginResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/13.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserLoginResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: UserLoginData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserLoginResponse {
        return UserLoginResponse(json: data as! Gloss.JSON)
    }
}

struct UserLoginData: Gloss.JSONDecodable {
    var userId: Int?
    var updateToken: String?
    var nickname: String?
    var avator: String?
    var phone: String?
    var email: String?
    var desp: String?
    var accessToken: String?
    
    init?(json: Gloss.JSON) {
        self.userId = "user_id" <~~ json
        self.updateToken = "update_token" <~~ json
        self.nickname = "nickname" <~~ json
        self.avator = "avator" <~~ json
        self.phone = "phone" <~~ json
        self.email = "email" <~~ json
        self.desp = "desp" <~~ json
        self.accessToken = "access_token" <~~ json
    }
}
