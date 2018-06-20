//
//  UserPencilUnbindResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct PencilUnbindResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: Any?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> PencilUnbindResponse {
        return PencilUnbindResponse(json: data as! Gloss.JSON)
    }
}
