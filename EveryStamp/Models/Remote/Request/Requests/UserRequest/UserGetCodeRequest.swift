//
//  UserGetCodeRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/17.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct UserGetCodeRequest: BaseRequest {
    
    typealias Response = UserGetCodeResponse
    
    var path: String {
        return "api/code/getcode/"
    }
    
    var paramater: [String : Any]?
    
    init(time: String, token: String, name: String, isExist: Int, type: Int, checkExist: Int) {
        paramater = ["time": time , "token": token, "name": name,"is_exist": isExist,"type": type, "check_exist": checkExist]
    }
    
}
