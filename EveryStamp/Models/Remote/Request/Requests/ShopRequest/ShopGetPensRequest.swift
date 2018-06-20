//
//  UserShopGetPensRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct ShopGetPensRequest: BaseRequest {
    typealias Response = ShopGetPensResponse
    
    var path: String {
        return "api/shop/getpens"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shoper_id: Int, shop_id: Int) {
        paramater = ["access_token": access_token, "shoper_id": shoper_id, "shop_id": shop_id]
    }
}
