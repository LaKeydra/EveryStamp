//
//  DeleteShopRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct DeleteShopRequest: BaseRequest {
    typealias Response = DeleteShopResponse
    var path: String {
        return "api/shop/delete"
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, shoperId: Double, shopId: Double) {
        paramater = ["access_token": accessToken, "shoper_id": shoperId, "shop_id": shopId]
    }
}
