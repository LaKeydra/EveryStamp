//
//  UserGetCollectShopsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetCollectShopsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetCollectShopsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetCollectShopsResponse {
        return UserGetCollectShopsResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetCollectShopsData: Gloss.JSONDecodable {
    var shopId: String?
    var stampCount: String? //单轮次的集章数目，目前暂无使用地方
    var totalStampCount: String? //目前已集的章数
    var nextStampCount: String? //下次领奖需要集的章数
    var minStampRules: String?
    var minStampCount: String? //单轮次的最小集章数，目前暂无使用地方
    var maxStampCount: String? //单轮次的最大集章数，目前暂无使用地方
    var name: String?
    var address: String?
    var typeId: String?
    var signUrl: String?
    var avatorUrl: String?
    var typeName: String?
    var hasReward: Int? //是否有奖励领取，1表示有，0表示无
    
    init?(json: Gloss.JSON) {
        self.shopId = "shop_id" <~~ json
        self.stampCount = "stamp_count" <~~ json
        self.totalStampCount = "total_stamp_count" <~~ json
        self.nextStampCount = "next_stamp_count" <~~ json
        self.minStampRules = "min_stamp_rules" <~~ json
        self.minStampCount = "min_stamp_count" <~~ json
        self.maxStampCount = "max_stamp_count" <~~ json
        self.name = "name" <~~ json
        self.address = "address" <~~ json
        self.typeId = "type_id" <~~ json
        self.signUrl = "sign_url" <~~ json
        self.avatorUrl = "avator_url" <~~ json
        self.typeName = "type_name" <~~ json
        self.hasReward = "has_reward" <~~ json
    }
}
