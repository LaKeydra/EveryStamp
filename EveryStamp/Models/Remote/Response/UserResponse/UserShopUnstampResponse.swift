//
//  UserShopUnstampResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/21.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserShopUnstampResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: UserShopUnstampData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserShopUnstampResponse {
        return UserShopUnstampResponse(json: data as! Gloss.JSON)
    }
}

struct UserShopUnstampData: Gloss.JSONDecodable {
    var stamp_count: Int?
    
    init?(json: Gloss.JSON) {
        self.stamp_count = "stamp_count" <~~ json
    }
}
