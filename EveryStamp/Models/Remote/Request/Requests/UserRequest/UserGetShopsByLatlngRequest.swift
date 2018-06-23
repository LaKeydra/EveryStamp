//
//  UserGetShopsByLatlngRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetShopsByLatlngRequest: BaseRequest {
    typealias Response = UserGetAllShopsResponse
    
    var path: String {
        return "api/shops/getshops_bylatlng"
    }
    
    var paramater: [String : Any]?
    
    init(time: String,token: String, lat: Float, lng: Float, distance: Float, page: Int, num: Int) {
        paramater = ["time": time, "token": token, "lat": lat, "lng": lng, "distance": distance, "page": page, "num": num]
    }
}
