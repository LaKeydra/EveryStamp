//
//  RefreshAccessCredentialsResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct RefreshAccessCredentialsResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: RefreshAccessCredentialsData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> RefreshAccessCredentialsResponse {
        return RefreshAccessCredentialsResponse(json: data as! Gloss.JSON)
    }
}

struct RefreshAccessCredentialsData: Gloss.JSONDecodable {
    var shoperId: String?
    var updateToken: String?
    var accessToken: String?
    
    init?(json: Gloss.JSON) {
        self.shoperId = "shoper_id" <~~ json
        self.updateToken = "update_token" <~~ json
        self.accessToken = "access_token" <~~ json
    }
}
