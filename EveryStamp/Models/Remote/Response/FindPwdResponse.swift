//
//  FindPwdResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct FindPwdResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: String?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> FindPwdResponse {
        return FindPwdResponse(json: data as! Gloss.JSON)
    }
}
