//
//  UserSendMsgByDisRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/20.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct SendMsgByDisRequest: BaseRequest {
    typealias Response = SendMsgByDisResponse
    
    var path: String {
        return "api/shop/sendmsgbydis"
    }
    
    var paramater: [String : Any]?
    
    init(access_token: String, shop_id: Int, name: String, desp: String, content: String, url: String, img_url: UIImage, img_alt: String) {
        paramater = ["access_token": access_token, "shop_id": shop_id, "name": name, "desp": desp, "content": content, "url": url, "img_url": img_url, "img_alt": img_alt]
    }
}
