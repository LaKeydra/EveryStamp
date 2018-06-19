//
//  UserGetShopMsgsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetShopMsgsRequest: BaseRequest {
    typealias Response = UserGetShopMsgsResponse
    
    var path: String {
        return "api/user/getshopmsgs"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, type: Int, page: Int, num: Int) {
        paramater = ["access_token": access_token, "user_id": user_id, "type": type, "page": page, "num": num]
    }
}
