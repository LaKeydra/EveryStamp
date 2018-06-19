//
//  UserShopGetRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserShopGetRequest: BaseRequest {
    typealias Response = UserShopGetResponse
    
    var path: String {
        return "api/shop/get"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int, is_all: Int) {
        paramater = ["access_token": access_token, "shop_id": shop_id, "is_all": is_all]
    }
}
