//
//  UserShopStampRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserShopStampRequest: BaseRequest {
    typealias Response = UserShopStampResponse
    
    var path: String {
        return "api/user/shopstamp"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, shop_id: Int, pen_serial: String) {
        paramater = ["access_token": access_token,"user_id": user_id, "shop_id": shop_id, "pen_serial": pen_serial]
    }
}
