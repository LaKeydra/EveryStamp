//
//  UserDeleteMsgRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

import Foundation

struct UserDeleteMsgRequest: BaseRequest {
    typealias Response = UserDeleteMsgResponse
    
    var path: String {
        return "api/user/deletemsg"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, msg_ids: String) {
        paramater = ["access_token": access_token, "user_id": user_id, "msg_ids": msg_ids]
    }
}
