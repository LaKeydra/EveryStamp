//
//  UserReadMsgRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserReadMsgRequest: BaseRequest {
    typealias Response = UserReadMsgResponse
    
    var path: String {
        return "api/user/readmsg"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, msg_ids: String) {
        paramater = ["access_token": access_token, "user_id": user_id, "msg_ids": msg_ids]
    }
}
