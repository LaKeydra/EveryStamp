//
//  UserGetCouponsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetCouponsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetCouponsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetCouponsResponse {
        return UserGetCouponsResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetCouponsData: Gloss.JSONDecodable {
    var coupon_id: Int?
    var stamp_count: Int?
    var desp: String?
    var rules: String?
    var begin_time: String?
    var end_time: String?
    var img_urls: String?
    var img_alts: String?
    
    init?(json: Gloss.JSON) {
        self.coupon_id = "coupon_id" <~~ json
        self.stamp_count = "stamp_count" <~~ json
        self.desp = "desp" <~~ json
        self.rules = "rules" <~~ json
        self.begin_time = "begin_time" <~~ json
        self.end_time = "end_time" <~~ json
        self.img_urls = "img_urls" <~~ json
        self.img_alts = "img_alts" <~~ json
    }
}
