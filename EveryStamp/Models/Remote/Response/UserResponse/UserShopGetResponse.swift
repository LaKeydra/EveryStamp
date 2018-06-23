//
//  UserShopGetResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/19.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserShopGetResponse: Decodable {
    var code: Int?
    var msg: String?
    var data: UserShopGetShortData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserShopGetResponse {
        return UserShopGetResponse(json: data as! Gloss.JSON)
    }
}

struct UserShopGetShortData: Gloss.JSONDecodable {
    var shop_id: Int?
    var name: String?
    var desp: String?
    var type_id: Int?
    var type_name: String?
    var sign_url: String?
    var avator_url: String?
    var point_rules: String?
    var latitude: String?
    var longitude: String?
    var province: String?
    var city: String?
    var district: String?
    var address: String?
    var status: Int?
    
    init?(json: Gloss.JSON) {
        self.shop_id = "shop_id" <~~ json
        self.name = "name" <~~ json
        self.desp = "desp" <~~ json
        self.type_id = "type_id" <~~ json
        self.type_name = "type_name" <~~ json
        self.sign_url = "sign_url" <~~ json
        self.avator_url = "avator_url" <~~ json
        self.point_rules = "point_rules" <~~ json
        self.latitude = "latitude" <~~ json
        self.desp = "desp" <~~ json
        self.longitude = "longitude" <~~ json
        self.province = "province" <~~ json
        self.city = "city" <~~ json
        self.district = "district" <~~ json
        self.address = "address" <~~ json
        self.status = "status" <~~ json
    }
}

struct UserShopGetDetailData: Gloss.JSONDecodable {
    var shop_id: Int?
    var name: String?
    var desp: String?
    var sign_url: String?
    var avator_url: String?
    var point_rules: String?
    var latitude: String?
    var longitude: String?
    var province: String?
    var city: String?
    var district: String?
    var address: String?
    var company: String?
    var telephone: String?
    var mobilephone: String?
    var open_begin_time: Int?
    var open_end_time: Int?
    var stamp_begin_time: Int?
    var stamp_end_time: Int?
    var img_urls: String?
    var img_alts: String?
    var status: Int?
    
    init?(json: Gloss.JSON) {
        self.shop_id = "shop_id" <~~ json
        self.name = "name" <~~ json
        self.desp = "desp" <~~ json
        self.sign_url = "sign_url" <~~ json
        self.avator_url = "avator_url" <~~ json
        self.point_rules = "point_rules" <~~ json
        self.latitude = "latitude" <~~ json
        self.desp = "desp" <~~ json
        self.longitude = "longitude" <~~ json
        self.province = "province" <~~ json
        self.city = "city" <~~ json
        self.district = "district" <~~ json
        self.address = "address" <~~ json
        self.company = "company" <~~ json
        self.telephone = "telephone" <~~ json
        self.mobilephone = "mobilephone" <~~ json
        self.open_begin_time = "open_begin_time" <~~ json
        self.open_end_time = "open_end_time" <~~ json
        self.stamp_begin_time = "stamp_begin_time" <~~ json
        self.stamp_end_time = "stamp_end_time" <~~ json
        self.img_urls = "img_urls" <~~ json
        self.img_alts = "img_alts" <~~ json
        self.status = "status" <~~ json
    }
}
