//
//  UserUpdatetokenRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserUpdatetokenRequest: BaseRequest {
    
    typealias Response = UserUpdatetokenResponse
    
    var path: String {
        return "api/app/updatetoken"
    }

    var paramater: [String : Any]?
    
    init(time: String, token: String, userId: Double, updateToken: String) {
        paramater = ["time": time , "token": token, "user_id": userId,"update_token": updateToken]
    }
    
}
