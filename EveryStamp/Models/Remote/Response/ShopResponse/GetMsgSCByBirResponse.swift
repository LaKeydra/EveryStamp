//
//  UserGetMsgSCByBirResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct GetMsgSCByBirResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: GetMsgSCByBirData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> GetMsgSCByBirResponse {
        return GetMsgSCByBirResponse(json: data as! Gloss.JSON)
    }
}

struct GetMsgSCByBirData: Gloss.JSONDecodable {
    var user_count: Int?
    
    init?(json: Gloss.JSON) {
        self.user_count = "user_count" <~~ json
    }
}
