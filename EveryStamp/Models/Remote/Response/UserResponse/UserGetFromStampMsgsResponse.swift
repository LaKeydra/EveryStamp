//
//  UserGetFromStampMsgsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetFromStampMsgsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetFromStampMsgsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetFromStampMsgsResponse {
        return UserGetFromStampMsgsResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetFromStampMsgsData: Gloss.JSONDecodable {
    var stamp_msg_id: String?
    var type: String?
    var user_id: String?
    var user_name: String?
    var timestamp: String?
    var shop_id: String?
    var shop_name: String?
    var status: String?
   
    init?(json: Gloss.JSON) {
        self.stamp_msg_id = "stamp_msg_id" <~~ json
        self.type = "type" <~~ json
        self.user_id = "user_id" <~~ json
        self.user_name = "user_name" <~~ json
        self.timestamp = "timestamp" <~~ json
        self.shop_id = "shop_id" <~~ json
        self.shop_name = "shop_name" <~~ json
        self.status = "status" <~~ json
    }
}
