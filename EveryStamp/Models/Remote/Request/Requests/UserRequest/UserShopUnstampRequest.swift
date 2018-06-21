//
//  UserShopUnstampRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserShopUnstampRequest: BaseRequest {
    typealias Response = UserShopUnstampResponse
    
    var path: String {
        return "api/user/shopunstamp"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, pen_serial: String, stamp_id: Int,stamp_count: Int) {
        paramater = ["access_token": access_token,"user_id": user_id, "pen_serial": pen_serial, "stamp_id": stamp_id, "stamp_count": stamp_count]
    }
}
