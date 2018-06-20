//
//  UserShopGetPensResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct ShopGetPensResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: [ShopGetPensData] = []
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json ?? []
    }
    
    static func parse(data: Any) -> ShopGetPensResponse {
        return ShopGetPensResponse(json: data as! Gloss.JSON)
    }
}

struct ShopGetPensData: Gloss.JSONDecodable {
    var pen_id: String?
    var serial: String?
    
    init?(json: Gloss.JSON) {
        self.pen_id = "pen_id" <~~ json
        self.serial = "serial" <~~ json
    }
}
