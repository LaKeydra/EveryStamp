//
//  UserGetRewardsCountResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetRewardsCountResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [UserGetRewardsCountData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> UserGetRewardsCountResponse {
        return UserGetRewardsCountResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetRewardsCountData: Gloss.JSONDecodable {
    var count: Int?
    var status: Int?
    
    init?(json: Gloss.JSON) {
        self.count = "count" <~~ json
        self.status = "status" <~~ json
    }
}
