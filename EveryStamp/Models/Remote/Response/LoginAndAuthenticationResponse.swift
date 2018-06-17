//
//  LoginAndAuthenticationResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct LoginAndAuthenticationResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: LoginAndAuthenticationData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> LoginAndAuthenticationResponse {
        return LoginAndAuthenticationResponse(json: data as! Gloss.JSON)
    }
}

struct LoginAndAuthenticationData: Gloss.JSONDecodable {
    var shoperId: String?
    var updateToken: String?
    var accessToken: String?
    var shopId: String?
    
    init?(json: Gloss.JSON) {
        self.shoperId = "shoper_id" <~~ json
        self.updateToken = "update_token" <~~ json
        self.accessToken = "access_token" <~~ json
        self.shopId = "shop_id" <~~ json
    }
}
