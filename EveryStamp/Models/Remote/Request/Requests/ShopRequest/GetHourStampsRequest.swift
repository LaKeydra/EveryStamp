//
//  UserGetHourStampsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct GetHourStampsRequest: BaseRequest {
    typealias Response = GetHourStampsResponse
    
    var path: String {
        return "api/shop/gethourstamps"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int) {
        paramater = ["access_token": access_token, "shop_id": shop_id]
    }
}
