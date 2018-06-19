//
//  UserGetShopStateRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/19.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetShopStateRequest: BaseRequest {
    typealias Response = UserGetShopStateResponse
    
    var path: String {
        return "api/user/getshopstate"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, userId: Double, shopId: Double) {
        paramater = ["access_token": accessToken, "user_id": userId, "shop_id": shopId]
    }
}
