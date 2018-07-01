//
//  UserGetSystemMsgsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetSystemMsgsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetSystemMsgsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetSystemMsgsResponse {
        return UserGetSystemMsgsResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetSystemMsgsData: Gloss.JSONDecodable {
    var msg_id: Int?
    var msg_text_id: Int?
    var name: String?
    var msg_time: String?
    var img_url: String?
    var img_alt: String?
    var status: String?
    
    init?(json: Gloss.JSON) {
        self.msg_id = "msg_id" <~~ json
        self.msg_text_id = "msg_text_id" <~~ json
        self.name = "name" <~~ json
        self.msg_time = "msg_time" <~~ json
        self.img_url = "img_url" <~~ json
        self.img_alt = "img_alt" <~~ json
        self.status = "status" <~~ json
    }
}
