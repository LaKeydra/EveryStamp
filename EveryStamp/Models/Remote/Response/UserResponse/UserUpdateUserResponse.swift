//
//  UserUpdateUserResponse.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Gloss

struct UserUpdateUserResponse:Decodable {
    var code: Int?
    var msg: String?
    var data: UserUpdateUserData?
    
    init(json: Gloss.JSON) {
        self.code = "code" <~~ json
        self.msg = "msg" <~~ json
        self.data = "data" <~~ json
    }
    
    static func parse(data: Any) -> UserUpdateUserResponse {
        return UserUpdateUserResponse(json: data as! Gloss.JSON)
    }
}

struct UserUpdateUserData: Gloss.JSONDecodable {
    var userId: Double?
    var nickname: String?
    var avator: String?
    var description: String?
    var birthday: String?
    var sex: Int?
    var country: String?
    var province: String?
    var city: String?
    var district: String?
    var phone: String?
    var email:String?
    
    init?(json: Gloss.JSON) {
        self.userId = "user_id" <~~ json
        self.nickname = "nickname" <~~ json
        self.avator = "avator" <~~ json
        self.description = "description" <~~ json
        self.birthday = "birthday" <~~ json
        self.sex = "sex" <~~ json
        self.country = "country" <~~ json
        self.province = "province" <~~ json
        self.city = "city" <~~ json
        self.district = "district" <~~ json
        self.phone = "phone" <~~ json
        self.email = "email" <~~ json
    }
}
