//
//  UserPencilUnbindRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct PencilUnbindRequest: BaseRequest {
    typealias Response = PencilUnbindResponse
    
    var path: String {
        return "api/pencil/unbind"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shoper_id: Int, shop_id: Int, pen_id: Int) {
        paramater = ["access_token": access_token, "shoper_id": shoper_id, "shop_id": shop_id, "pen_id": pen_id]
    }
}
