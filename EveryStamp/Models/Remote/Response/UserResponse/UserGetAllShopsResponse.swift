//
//  UserGetAllShopsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetAllShopsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetAllShopsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetAllShopsResponse {
        return UserGetAllShopsResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetAllShopsData: Gloss.JSONDecodable {
    var shop_id: Int?
    var name: String?
    var desp: String?
    var type_id: String?
    var min_stamp_rules: String?
    var min_stamp_count: String?
    var max_stamp_count: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    var sign_url: String?
    var avator_url: String?
    var is_recommend: String?
    var stars: String?
    var type_name: String?
    
    
    init?(json: Gloss.JSON) {
        self.shop_id = "shop_id" <~~ json
        self.name = "name" <~~ json
        self.desp = "desp" <~~ json
        self.type_id = "type_id" <~~ json
        self.min_stamp_rules = "min_stamp_rules" <~~ json
        self.min_stamp_count = "min_stamp_count" <~~ json
        self.max_stamp_count = "max_stamp_count" <~~ json
        self.address = "address" <~~ json
        self.latitude = "latitude" <~~ json
        self.longitude = "longitude" <~~ json
        self.sign_url = "sign_url" <~~ json
        self.avator_url = "avator_url" <~~ json
        self.is_recommend = "is_recommend" <~~ json
        self.stars = "stars" <~~ json
        self.type_name = "type_name" <~~ json
    }
}
