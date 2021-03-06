//
//  UserGetFromStampMsgRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetFromStampMsgRequest: BaseRequest {
    typealias Response = UserGetFromStampMsgResponse
    
    var path: String {
        return "api/user/getfromstampmsg"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, user_id: Int, stamp_msg_id: Int) {
        paramater = ["access_token": access_token,"user_id": user_id, "stamp_msg_id": stamp_msg_id]
    }
}
