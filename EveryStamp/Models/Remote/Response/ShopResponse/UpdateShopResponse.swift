//
//  UpdateShopResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UpdateShopResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: UpdateShopData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UpdateShopResponse {
        return UpdateShopResponse(json: data as! Gloss.JSON)
    }
}

struct UpdateShopData: Gloss.JSONDecodable {
    var shopId: String?
    var name: String?
    var desp: String?
    var typeId: String?
    var typeName: String?
    var latitude: String?
    var longitude: String?
    var telephone: String?
    var mobilephone: String?
    var openBeginTime: String?
    var openEndTime: String?
    var stampBeginTime: String?
    var stampEndTime: String?
    var pointRules: String?
    var country: String?
    var province: String?
    var city: String?
    var district: String?
    var address: String?
    var company: String?
    
    init?(json: Gloss.JSON) {
        self.shopId = "shop_id" <~~ json
        self.name = "name" <~~ json
        self.desp = "desp" <~~ json
        self.typeId = "type_id" <~~ json
        self.typeName = "type_name" <~~ json
        self.latitude = "latitude" <~~ json
        self.longitude = "longitude" <~~ json
        self.telephone = "telephone" <~~ json
        self.mobilephone = "mobilephone" <~~ json
        self.openBeginTime = "open_begin_time" <~~ json
        self.openEndTime = "stamp_end_time" <~~ json
        self.stampBeginTime = "stamp_begin_time" <~~ json
        self.stampEndTime = "stamp_end_time" <~~ json
        self.pointRules = "point_rules" <~~ json
        self.country = "country" <~~ json
        self.province = "province" <~~ json
        self.city = "city" <~~ json
        self.district = "district" <~~ json
        self.address = "address" <~~ json
        self.company = "company" <~~ json
    }
}
