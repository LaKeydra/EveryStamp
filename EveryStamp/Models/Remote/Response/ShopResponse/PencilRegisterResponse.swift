//
//  UserPencilRegisterResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct PencilRegisterResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: PencilRegisterData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> PencilRegisterResponse {
        return PencilRegisterResponse(json: data as! Gloss.JSON)
    }
}

struct PencilRegisterData: Gloss.JSONDecodable {
    var pen_id: String?
    var pen_serial: String?
    var order_number: String?
    
    init?(json: Gloss.JSON) {
        self.pen_id = "pen_id" <~~ json
        self.pen_serial = "pen_serial" <~~ json
        self.order_number = "order_number" <~~ json
    }
}
