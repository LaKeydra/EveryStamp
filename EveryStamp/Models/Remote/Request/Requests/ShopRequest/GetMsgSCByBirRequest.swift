//
//  UserGetMsgSCByBirRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct GetMsgSCByBirRequest: BaseRequest {
    typealias Response = GetMsgSCByBirResponse
    
    var path: String {
        return "api/shop/getmsgscbybir"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int, begin_time: Date, end_time: Date) {
        paramater = ["access_token": access_token, "shop_id": shop_id, "begin_time": begin_time, "end_time": end_time]
    }
}
