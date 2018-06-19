//
//  UserUpdateLatlngRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserUpdateLatlngRequest: BaseRequest {
    typealias Response = UserUpdateLatlngResponse
    var path: String {
        return "api/user/updateuserlatlng"
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, userId: Double, latitude: Float, longitude: Float) {
        paramater = ["access_token": accessToken, "user_id": userId, "latitude": latitude, "longitude": longitude]
    }
}
