//
//  UserFeedbackRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserFeedbackRequest: BaseRequest {
    typealias Response = UserFeedbackResponse
    
    var path: String {
        return "api/system/feedback"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, contact: String, content: String, from: String, user_id: Int) {
        paramater = ["access_token": access_token, "contact": contact, "content": content, "from": from, "user_id": user_id]
    }
}
