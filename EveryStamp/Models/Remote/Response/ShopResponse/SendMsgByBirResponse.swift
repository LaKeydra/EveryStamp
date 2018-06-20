//
//  UserSendMsgByBirResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct SendMsgByBirResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: SendMsgByBirData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> SendMsgByBirResponse {
        return SendMsgByBirResponse(json: data as! Gloss.JSON)
    }
}

struct SendMsgByBirData: Gloss.JSONDecodable {
    var name: String?
    var desp: String?
    var content: String?
    var url: String?
    var img_alt: String?
    var img_url: String?
    var user_count: Int?
    var msg_text_id: String?
    var msg_time: String?
    
    init?(json: Gloss.JSON) {
        self.name = "name" <~~ json
        self.desp = "desp" <~~ json
        self.content = "content" <~~ json
        self.url = "url" <~~ json
        self.img_alt = "img_alt" <~~ json
        self.img_url = "img_url" <~~ json
        self.user_count = "user_count" <~~ json
        self.msg_text_id = "msg_text_id" <~~ json
        self.msg_time = "msg_time" <~~ json
        
    }
    
}
