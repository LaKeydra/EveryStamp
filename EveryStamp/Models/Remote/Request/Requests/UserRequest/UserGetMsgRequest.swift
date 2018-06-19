//
//  UserGetMsgRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetMsgRequest: BaseRequest {
    typealias Response = UserGetMsgResponse
    
    var path: String {
        return "api/user/getmsg"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
 
    init(access_token: String, user_id: Int, msg_text_id: Int) {
        paramater = ["access_token": access_token, "user_id": user_id, "msg_text_id": msg_text_id]
    }
}
