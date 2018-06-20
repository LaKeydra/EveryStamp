//
//  UserGetMsgSCByDisResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct GetMsgSCByDisResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: GetMsgSCByDisData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> GetMsgSCByDisResponse {
        return GetMsgSCByDisResponse(json: data as! Gloss.JSON)
    }
}

struct GetMsgSCByDisData: Gloss.JSONDecodable {
    var user_count: Int?
    
    init?(json: Gloss.JSON) {
        self.user_count = "user_count" <~~ json
    }
}
