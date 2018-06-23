//
//  UserGetAllShopsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetAllShopsRequest: BaseRequest {
    typealias Response = UserGetAllShopsResponse
    
    var path: String {
        return "api/shops/getallshops"
    }
    
    var paramater: [String : Any]?
    
    init(time: String, token: String, page: Int, num: Int, is_recommend: Int) {
        paramater = ["time": time,"token": token, "page": page, "num": num, "is_recommend": is_recommend]
    }
}
