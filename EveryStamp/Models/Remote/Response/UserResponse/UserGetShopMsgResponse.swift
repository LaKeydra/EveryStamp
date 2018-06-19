//
//  UserGetShopMsgResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetShopMsgResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetShopMsgData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetShopMsgResponse {
        return UserGetShopMsgResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetShopMsgData: Gloss.JSONDecodable {
    var msg_id: Int?
    var msg_text_id: Int?
    var name: String?
    var desp: String?
    var img_url: String?
    var img_alt: String?
    var public_time: Int?
    
    init?(json: Gloss.JSON) {
        self.msg_id = "msg_id" <~~ json
        self.msg_text_id = "msg_text_id" <~~ json
        self.name = "name" <~~ json
        self.desp = "desp" <~~ json
        self.img_url = "img_url" <~~ json
        self.img_alt = "img_alt" <~~ json
        self.public_time = "public_time" <~~ json
    }
}
