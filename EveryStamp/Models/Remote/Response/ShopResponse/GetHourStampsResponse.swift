//
//  UserGetHourStampsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct GetHourStampsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [GetHourStampsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> GetHourStampsResponse {
        return GetHourStampsResponse(json: data as! Gloss.JSON)
    }
}

struct GetHourStampsData: Gloss.JSONDecodable {
    var stamp_count: Int?
    var user_name: String?
    var date: String?
    
    init?(json: Gloss.JSON) {
        self.stamp_count = "stamp_count" <~~ json
        self.user_name = "user_name" <~~ json
        self.date = "date" <~~ json
    }
}
