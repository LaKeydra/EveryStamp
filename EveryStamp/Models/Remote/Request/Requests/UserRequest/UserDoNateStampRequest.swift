//
//  UserDoNateStampRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserDoNateStampRequest: BaseRequest {
    typealias Response = UserDoNateStampResponse
    
    var path: String {
        return "api/user/donatestamp"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, shop_id: Int, stamp_id: Int, to_uid: Int, stamp_msg_id: Int) {
        paramater = ["access_token": access_token,"user_id": user_id, "shop_id": shop_id, "stamp_id": stamp_id, "to_uid": to_uid, "stamp_msg_id": stamp_msg_id]
    }
}
