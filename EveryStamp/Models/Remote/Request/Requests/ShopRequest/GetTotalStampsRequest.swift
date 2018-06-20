//
//  GetTotalStampsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct GetTotalStampsRequest: BaseRequest {
    typealias Response = GetTotalStampsResponse
    
    var path: String {
        return "api/shop/gettotalstamps"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int) {
        paramater = ["access_token": access_token, "shop_id": shop_id]
    }
}
