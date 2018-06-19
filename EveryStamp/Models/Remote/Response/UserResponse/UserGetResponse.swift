//
//  UserGetResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserGetResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: UserGetData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserGetResponse {
        return UserGetResponse(json: data as! Gloss.JSON)
    }
}

struct UserGetData: Gloss.JSONDecodable {
    var userId: Int?
    var nickname: String?
    var avator: String?
    var phone: String?
    var email: String?
    var sex: Int?
    var controy: String?
    var province: String?
    var city: String?
    var district: String?
    var desp: String?
    var birthday: Double?
    var latitude: String?
    var longitude: String?
    
    init?(json: Gloss.JSON) {
        self.userId = "user_id" <~~ json
        self.nickname = "nickname" <~~ json
        self.avator = "avator" <~~ json
        self.phone = "phone" <~~ json
        self.email = "email" <~~ json
        self.sex = "sex" <~~ json
        self.controy = "controy" <~~ json
        self.province = "province" <~~ json
        self.city = "city" <~~ json
        self.district = "district" <~~ json
        self.desp = "desp" <~~ json
        self.birthday = "birthday" <~~ json
        self.latitude = "latitude" <~~ json
        self.longitude = "longitude" <~~ json
    }
}
