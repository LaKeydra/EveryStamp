//
//  UserGetRewardsCountRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetRewardsCountRequest: BaseRequest {
    typealias Response = UserGetRewardsCountResponse
    
    var path: String {
        return "api/user/getrewardscount"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, shop_id: Int, next_stamp_count: Int) {
        paramater = ["access_token": access_token,"user_id": user_id, "shop_id": shop_id, "next_stamp_count": next_stamp_count]
    }
}
