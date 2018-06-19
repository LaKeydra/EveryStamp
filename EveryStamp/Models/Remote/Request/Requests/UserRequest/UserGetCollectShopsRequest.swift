//
//  UserGetCollectShopsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/19.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetCollectShopsRequest: BaseRequest {
    typealias Response = UserGetCollectShopsResponse
    var path: String {
        return "api/user/getcollectshops"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, userId: Double, page: Double, num: Double) {
        paramater = ["access_token": accessToken, "user_id": userId, "page": page, "num": num]
    }
}
