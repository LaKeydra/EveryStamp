//
//  CheckOrderRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct CheckOrderRequest: BaseRequest {
    typealias Response = CheckOrderResponse
    var path: String {
        return "api/shop/check_order"
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, shoperId: Double, orderNumber: String) {
        paramater = ["access_token": accessToken, "shoper_id": shoperId, "order_number": orderNumber]
    }
}
