//
//  UserGetShopMsgsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetShopMsgsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetShopMsgsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetShopMsgsResponse {
        return UserGetShopMsgsResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetShopMsgsData: Gloss.JSONDecodable {
    var msg_id: Int?
    var msg_text_id: Int?
    var msg_name: String?
    var msg_desp: String?
    var msg_time: Int?
    var status: Int?
    var shop_id: Int?
    var shop_name: String?
    var shop_avator_url: String?
    
    init?(json: Gloss.JSON) {
        self.msg_id = "msg_id" <~~ json
        self.msg_text_id = "msg_text_id" <~~ json
        self.msg_name = "msg_name" <~~ json
        self.msg_desp = "msg_desp" <~~ json
        self.msg_time = "msg_time" <~~ json
        self.status = "status" <~~ json
        self.shop_id = "shop_id" <~~ json
        self.shop_avator_url = "shop_avator_url" <~~ json
    }
}
