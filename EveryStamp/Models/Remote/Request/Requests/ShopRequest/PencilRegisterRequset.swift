//
//  UserPencilRegisterRequset.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct PencilRegisterRequset: BaseRequest {
    typealias Response = PencilRegisterResponse
    
    var path: String {
        return "api/pencil/register"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int, pen_serial: String, order_number: String) {
        paramater = ["access_token": access_token, "shop_id": shop_id, "pen_serial": pen_serial, "order_number": order_number]
    }
}
