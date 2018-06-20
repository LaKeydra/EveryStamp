//
//  UserGetSendMsgsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct GetSendMsgsRequest: BaseRequest {
    typealias Response = GetSendMsgsResponse
    
    var path: String {
        return "api/shop/getsendmsgs"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int, page: Int, num: Int) {
        paramater = ["access_token": access_token, "page": page, "num": num]
    }
}
