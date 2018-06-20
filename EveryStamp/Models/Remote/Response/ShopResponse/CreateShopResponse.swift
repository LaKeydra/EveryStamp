//
//  CreateShopResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct CreateShopResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: CreateShopData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> CreateShopResponse {
        return CreateShopResponse(json: data as! Gloss.JSON)
    }
}

struct CreateShopData: Gloss.JSONDecodable {  
    var shoperId: String?
    var name: String?
    var description: String?
    var orderNumber: String?
    
    init?(json: Gloss.JSON) {
        self.shoperId = "shoper_id" <~~ json
        self.name = "name" <~~ json
        self.description = "description" <~~ json
        self.orderNumber = "order_number" <~~ json
    }
}
