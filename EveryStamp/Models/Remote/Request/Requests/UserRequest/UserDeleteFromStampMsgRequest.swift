//
//  UserDeleteFromStampMsgRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserDeleteFromStampMsgRequest: BaseRequest {
    typealias Response = UserDeleteFromStampMsgResponse
    
    var path: String {
        return "api/user/deletefromstampmsg"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, stamp_msg_id: Int) {
        paramater = ["access_token": access_token,"user_id": user_id, "stamp_msg_id": stamp_msg_id]
    }
}
