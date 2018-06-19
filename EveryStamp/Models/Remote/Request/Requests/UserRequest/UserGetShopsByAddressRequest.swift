//
//  UserGetShopsByAddressRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetShopsByAddressRequest: BaseRequest {
    typealias Response = UserGetShopsResponse
    
    var path: String {
        return "api/shops/getshops_byaddress"
    }
    
    var paramater: [String : Any]?
    
    init(time: String,token: String, address: String, page: Int, num: Int) {
        paramater = ["time": time, "token": token, "address": address, "page": page, "num": num]
    }
}
