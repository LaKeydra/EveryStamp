//
//  UserGetFromStampMsgResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetFromStampMsgResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: UserGetFromStampMsgData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserGetFromStampMsgResponse {
        return UserGetFromStampMsgResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetFromStampMsgData: Gloss.JSONDecodable {
    var stamp_msg_id: Int?
    var type: Int?
    var user_id: Int?
    var user_name: String?
    var timestamp: Int?
    var shop_id: Int?
    var shop_name: String?
    var shop_address: String?
    var shop_type_id: String?
    var shop_avator_url: String?
    var status: Int?
    var shop_type_name: String?
    
    init?(json: Gloss.JSON) {
        self.stamp_msg_id = "stamp_msg_id" <~~ json
        self.type = "type" <~~ json
        self.user_id = "user_id" <~~ json
        self.user_name = "user_name" <~~ json
        self.timestamp = "timestamp" <~~ json
        self.shop_id = "shop_id" <~~ json
        self.shop_name = "shop_name" <~~ json
        self.shop_address = "shop_address" <~~ json
        self.shop_type_id = "shop_type_id" <~~ json
        self.shop_avator_url = "shop_avator_url" <~~ json
        self.status = "status" <~~ json
        self.shop_type_name = "shop_type_name" <~~ json
    }
}
