//
//  UserGetRewardsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetRewardsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetRewardsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetRewardsResponse {
        return UserGetRewardsResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetRewardsData: Gloss.JSONDecodable {
    var coupon_id: String?
    var stamp_count: String?
    var desp: String?
    var rules: String?
    var begin_time: String?
    var end_time: String?
    var avator_url: String?
    var total_stamp_count: String?
    var status: String?
    var reward_id: String?
    
    init?(json: Gloss.JSON) {
        self.coupon_id = "coupon_id" <~~ json
        self.stamp_count = "stamp_count" <~~ json
        self.desp = "desp" <~~ json
        self.rules = "rules" <~~ json
        self.begin_time = "begin_time" <~~ json
        self.end_time = "end_time" <~~ json
        self.avator_url = "avator_url" <~~ json
        self.total_stamp_count = "total_stamp_count" <~~ json
        self.status = "status" <~~ json
        self.reward_id = "reward_id" <~~ json
    }
}
