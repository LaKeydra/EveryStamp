//
//  UserGetFromStampMsgsRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetFromStampMsgsRequest: BaseRequest {
    typealias Response = UserGetFromStampMsgsResponse
    
    var path: String {
        return "api/user/getfromstampmsgs"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, page: Int, num: Int) {
        paramater = ["access_token": access_token,"user_id": user_id, "page": page,"num": num]
    }
}
