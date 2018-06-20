//
//  UserGetStampsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct GetStampsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: GetStampsData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> GetStampsResponse {
        return GetStampsResponse(json: data as! Gloss.JSON)
    }
}

struct GetStampsData: Gloss.JSONDecodable {
    var stamp_count: String?
    var stamp_time: String?
    
    init?(json: Gloss.JSON) {
        self.stamp_count = "stamp_count" <~~ json
        self.stamp_time = "stamp_time" <~~ json
    }
}

