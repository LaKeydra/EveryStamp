//
//  UserGetMsgResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//
import Foundation
import Gloss

struct UserGetMsgResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: Any?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserGetMsgResponse {
        return UserGetMsgResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetMsgData: Gloss.JSONDecodable {
    var msg_text_id: String?
    var name: String?
    var desp: String?
    var content: String?
    var url: String?
    var time: String?
    var img_url: String?
    var img_alt: String?
    
    init?(json: Gloss.JSON) {
        self.msg_text_id = "msg_text_id" <~~ json
        self.name = "name" <~~ json
        self.desp = "desp" <~~ json
        self.content = "content" <~~ json
        self.url = "url" <~~ json
        self.time = "time" <~~ json
        self.img_url = "img_url" <~~ json
        self.img_alt = "img_alt" <~~ json
    }
}
