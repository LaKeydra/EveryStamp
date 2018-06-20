//
//  UserOrderCheckRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct OrderCheckRequest: BaseRequest {
    typealias Response = OrderCheckResponse
    
    var path: String {
        return "api/pencil/ordercheck"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int, order_number: String) {
        paramater = ["access_token": access_token, "shop_id": shop_id, "order_number": order_number]
    }
}
