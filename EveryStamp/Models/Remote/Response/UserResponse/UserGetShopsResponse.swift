//
//  UserGetShopsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetShopsResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: UserGetShopsData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserGetShopsResponse {
        return UserGetShopsResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetShopsData: Gloss.JSONDecodable {
    var shop_id: Int?
    var name: String?
    var desp: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    
    init?(json: Gloss.JSON) {
        self.shop_id = "shop_id" <~~ json
        self.name = "name" <~~ json
        self.desp = "desp" <~~ json
        self.address = "address" <~~ json
        self.latitude = "latitude" <~~ json
        self.longitude = "longitude" <~~ json
    }
}
