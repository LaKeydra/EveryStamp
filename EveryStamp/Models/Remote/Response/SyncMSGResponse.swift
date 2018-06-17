//
//  SyncMSGResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct SyncMSGResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: SyncMSGData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> SyncMSGResponse {
        return SyncMSGResponse(json: data as! Gloss.JSON)
    }
}

struct SyncMSGData: Gloss.JSONDecodable {
    var syncTime: Double?
    
    init?(json: Gloss.JSON) {
        self.syncTime = "sync_time" <~~ json
    }
}
