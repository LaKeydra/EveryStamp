//
//  CheckOrderResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct CheckOrderResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: CheckOrderData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> CheckOrderResponse {
        return CheckOrderResponse(json: data as! Gloss.JSON)
    }
}

struct CheckOrderData: Gloss.JSONDecodable {
    var orderShopCount: String?
    var usedShopCount: Int?
    var usedShops: [usedShop] = []
    var orderLeaveCount: Int?
    
    init?(json: Gloss.JSON) {
        self.orderShopCount = "order_shop_count" <~~ json
        self.usedShopCount = "used_shop_count" <~~ json
        self.usedShops = ("used_shops" <~~ json) ?? []
        self.orderLeaveCount = "order_leave_count" <~~ json
    }
}

struct usedShop: Gloss.JSONDecodable {
    var shopId: String?
    var name: String?
    
    init?(json: Gloss.JSON) {
        self.shopId = "shop_id" <~~ json
        self.name = "name" <~~ json
    }
}
