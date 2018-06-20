//
//  SyncMSGRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct SyncMSGRequest: BaseRequest {
    typealias Response = SyncMSGResponse
    var path: String {
        return "api/shoper/sync"
    }
    
    var paramater: [String : Any]?
    
    init(accessToken: String, shoperId: Double) {
        paramater = ["access_token": accessToken, "shoper_id": shoperId]
    }
}
