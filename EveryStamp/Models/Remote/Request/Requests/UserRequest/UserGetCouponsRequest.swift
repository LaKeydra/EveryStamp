//
//  UserGetCouponsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetCouponsRequest: BaseRequest {
    typealias Response = UserGetCouponsResponse
    
    var path: String {
        return "api/shop/getcoupons"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int, page: Int, num: Int) {
        paramater = ["access_token": access_token, "shop_id": shop_id, "page": page, "num": num]
    }
}
