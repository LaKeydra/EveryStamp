//
//  UserGetShopMsgRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetShopMsgRequest: BaseRequest {
    typealias Response = UserGetShopMsgResponse
    
    var path: String {
        return "api/user/getshopmsg"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, shop_id: Int, type: Int) {
        paramater = ["access_token": access_token, "user_id": user_id, "shop_id": shop_id, "type": type]
    }
}
