//
//  UserCheckUserResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserCheckUserResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: UserCheckUserData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserCheckUserResponse {
        return UserCheckUserResponse(json: data as! Gloss.JSON)
    }
}

struct UserCheckUserData: Gloss.JSONDecodable {
    var user_id: Int?
    var avator: String?
    var nickname: String?
    
    init?(json: Gloss.JSON) {
        self.user_id = "user_id" <~~ json
        self.avator = "avator" <~~ json
        self.nickname = "nickname" <~~ json
    }
}
