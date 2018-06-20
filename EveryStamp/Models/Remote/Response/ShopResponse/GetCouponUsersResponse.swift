//
//  UserGetCouponUsersResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct GetCouponUsersResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: GetCouponUsersData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> GetCouponUsersResponse {
        return GetCouponUsersResponse(json: data as! Gloss.JSON)
    }
}

struct GetCouponUsersData: Gloss.JSONDecodable {
    var coupon_users_count: Int?
   
    init?(json: Gloss.JSON) {
        self.coupon_users_count = "coupon_users_count" <~~ json
    }
}
