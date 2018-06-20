//
//  GetCouponUsersRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct GetCouponUsersRequest: BaseRequest {
    typealias Response = GetCouponUsersResponse
    
    var path: String {
        return "api/shop/getcouponusers"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int) {
        paramater = ["access_token": access_token, "shop_id": shop_id]
    }
}
