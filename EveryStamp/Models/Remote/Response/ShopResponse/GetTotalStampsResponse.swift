//
//  UserGetTotalStampsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct GetTotalStampsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [GetTotalStampsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> GetTotalStampsResponse {
        return GetTotalStampsResponse(json: data as! Gloss.JSON)
    }
}

struct GetTotalStampsData: Gloss.JSONDecodable {
    var stamp_count: Int?
    var user_count: Int?
    
    init?(json: Gloss.JSON) {
        self.stamp_count = "stamp_count" <~~ json
        self.user_count = "user_count" <~~ json
    }
}

