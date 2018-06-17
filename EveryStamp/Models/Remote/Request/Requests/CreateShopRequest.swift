//
//  CreateShopRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct CreateShopRequest: BaseRequest {
    typealias Response = CreateShopResponse
    var path: String {
        return "api/shop/create"
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, shoperId: Double, orderNumber: String, name: String, description: String) {
        paramater = ["access_token": accessToken, "shoper_id": shoperId, "order_number": orderNumber, "name": name, "description": description]
    }
}
