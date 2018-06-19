//
//  UserUpdateUserRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserUpdateUserRequest: BaseRequest {
    typealias Response = UserUpdateUserResponse
    var path: String {
        return "api/user/updateuser"
    }
    
    var paramater: [String : Any]?
    
    init(model: UserUpdateUserParameterModel) {
        paramater = ["access_token": model.accessToken, "user_id": model.userId, "nickname": model.nickname, "birthday": model.birthday, "avator": model.avator, "sex": model.sex, "controy": model.controy, "province": model.province, "city": model.city, "district": model.district, "description": model.description, "latitude": model.latitude, "longitude": model.longitude]
    }
}

struct UserUpdateUserParameterModel {
    var accessToken: String
    var userId: Double
    var nickname: String
    var birthday: Date
    var avator: UIImage
    var sex: Int
    var controy: String
    var province: String
    var city: String
    var district: String
    var description: String
    var latitude: Float
    var longitude: Float
}
