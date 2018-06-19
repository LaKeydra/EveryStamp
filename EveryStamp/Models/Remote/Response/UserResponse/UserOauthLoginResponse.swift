//
//  UserOauthLoginResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserOauthLoginResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: UserOauthLoginData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserOauthLoginResponse {
        return UserOauthLoginResponse(json: data as! Gloss.JSON)
    }
}

struct UserOauthLoginData: Gloss.JSONDecodable {
    var userId: Int?
    var updateToken: String?
    var accessToken: String?
 
    init?(json: Gloss.JSON) {
        self.userId = "user_id" <~~ json
        self.updateToken = "update_token" <~~ json
        self.accessToken = "access_token" <~~ json
    }
}
