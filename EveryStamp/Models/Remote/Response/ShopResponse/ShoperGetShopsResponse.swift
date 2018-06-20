//
//  UserShoperGetShopsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct ShoperGetShopsResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [ShoperGetShopsData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> ShoperGetShopsResponse {
        return ShoperGetShopsResponse(json: data as! Gloss.JSON)
    }
}

struct ShoperGetShopsData: Gloss.JSONDecodable {
    var shop_id: String?
    var name: String?

    init?(json: Gloss.JSON) {
        self.shop_id = "shop_id" <~~ json
        self.name = "name" <~~ json
    }
}
