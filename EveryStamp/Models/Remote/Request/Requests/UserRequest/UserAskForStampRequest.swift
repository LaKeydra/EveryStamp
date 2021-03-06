//
//  UserAskForStampRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserAskForStampRequest: BaseRequest {
    typealias Response = UserAskForStampResponse
    
    var path: String {
        return "api/user/askforstamp"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, shop_id: Int, to_uid: Int) {
        paramater = ["access_token": access_token,"user_id": user_id, "shop_id": shop_id,"to_uid": to_uid]
    }
}
