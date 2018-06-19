//
//  UserGetShopStateResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/19.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetShopStateResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: UserGetShopStateData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserGetShopStateResponse {
        return UserGetShopStateResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetShopStateData: Gloss.JSONDecodable {
    var isAdd: Int? //1:已添加，0：未添加
    var isCollect: Int? //1:已收藏。0：未收藏
    var stampCount: Int? // 用户对此店铺的单轮集点数目，目前暂不需要使用地方
    var stampId: Int?  // 集章ID,用户对此店铺的最后一个集章，可用于转赠等
    var totalStampCount: Int? // 用户在店铺已集的章数
    var nextStampCount: Int? //用户下次领取奖励需要的章数
    var rewards: [UserGetShopStateReward] = [] //简单的奖励列表
    
    init?(json: Gloss.JSON) {
        self.isAdd = "is_add" <~~ json
        self.isCollect = "is_collect" <~~ json
        self.stampCount = "stamp_count" <~~ json
        self.stampId = "stamp_id" <~~ json
        self.totalStampCount = "total_stamp_count" <~~ json
        self.nextStampCount = "next_stamp_count" <~~ json
        self.rewards = "rewards" <~~ json ?? []
    }
}

struct UserGetShopStateReward: Gloss.JSONDecodable {
    var rewardId: Int?
    var shopId: Int?
    var stampId: Int?
    var couponId: Int?
    var stampCount: Int?
    var totalStampCount: Int?
    var timestamp: Int?
    
    init?(json: Gloss.JSON) {
        self.rewardId = "reward_id" <~~ json
        self.shopId = "shop_id" <~~ json
        self.stampId = "stamp_id" <~~ json
        self.couponId = "coupon_id" <~~ json
        self.stampCount = "stamp_count" <~~ json
        self.totalStampCount = "total_stamp_count" <~~ json
        self.timestamp = "timestamp" <~~ json
    }
}
