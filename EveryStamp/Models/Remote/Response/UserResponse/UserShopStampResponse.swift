//
//  UserShopStampResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserShopStampResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: UserShopStampData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserShopStampResponse {
        return UserShopStampResponse(json: data as! Gloss.JSON)
    }
}

struct UserShopStampData: Gloss.JSONDecodable {
    var stamp_id: Int?
    var shop_id: Int?
    var coupon_id: Int?
    var stamp_time: Int?
    var stamp_count: Int?
    var reward_id: Int?
    var total_stamp_count: Int?
    var next_stamp_count: Int?
    var shop_name: String?
    var shop_desp: String?
    var shop_type_id: Int?
    var shop_point_rules: String?
    var shop_type_name: String?
    var shop_sign_url: String?
    var shop_avator_url: String?
    
    init?(json: Gloss.JSON) {
        self.stamp_id = "stamp_id" <~~ json
        self.shop_id = "shop_id" <~~ json
        self.coupon_id = "coupon_id" <~~ json
        self.stamp_time = "stamp_time" <~~ json 
        self.stamp_count = "stamp_count" <~~ json
        self.reward_id = "reward_id" <~~ json
        self.total_stamp_count = "total_stamp_count" <~~ json
        self.next_stamp_count = "next_stamp_count" <~~ json
        self.shop_name = "shop_name" <~~ json
        self.shop_desp = "shop_desp" <~~ json
        self.shop_type_id = "shop_type_id" <~~ json
        self.shop_point_rules = "shop_point_rules" <~~ json
        self.shop_type_name = "shop_type_name" <~~ json
        self.shop_sign_url = "shop_sign_url" <~~ json
        self.shop_avator_url = "shop_avator_url" <~~ json
    }
}
