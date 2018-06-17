//
//  Authentication.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct Authentication : Decodable {
    var accessToken:String?
    
    init?(json:Gloss.JSON) {
        accessToken = "access_token" <~~ json
    }
    
    static func parse(data: Any) -> Authentication {
        let json = data as! Gloss.JSON
        return Authentication(json: json)!
    }
}
