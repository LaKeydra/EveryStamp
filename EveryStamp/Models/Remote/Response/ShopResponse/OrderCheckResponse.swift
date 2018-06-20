//
//  UserOrderCheckResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct OrderCheckResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: OrderCheckData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> OrderCheckResponse {
        return OrderCheckResponse(json: data as! Gloss.JSON)
    }
}

struct OrderCheckData: Gloss.JSONDecodable {
    var order_pen_count: String?
    var used_pen_count: Int?
    var used_pens: [OrderUsedPen] = []
    var order_leave_count: Int?
    
    init?(json: Gloss.JSON) {
        self.order_pen_count = "order_pen_count" <~~ json
        self.used_pen_count = "used_pen_count" <~~ json
        self.used_pens = "used_pens" <~~ json ?? []
        self.order_leave_count = "order_leave_count" <~~ json
    }
}

struct OrderUsedPen: Gloss.JSONDecodable {
    var pen_id: String?
    var pen_serial: String?
    
    init?(json: Gloss.JSON) {
        self.pen_id = "pen_id" <~~ json
        self.pen_serial = "pen_serial" <~~ json
    }
}
