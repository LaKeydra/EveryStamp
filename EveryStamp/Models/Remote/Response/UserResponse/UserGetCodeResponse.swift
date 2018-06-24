//
//  UserGetCodeResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetCodeResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: UserGetCodeData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserGetCodeResponse {
        return UserGetCodeResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetCodeData: Gloss.JSONDecodable {
    var code: Int?
    init?(json: Gloss.JSON) {
        self.code = "code" <~~ json
    }
}
