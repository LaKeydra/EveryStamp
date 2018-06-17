//
//  VerificationCodeAcquisitionRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

struct VerificationCodeAcquisitionRequest: BaseRequest {
    typealias Response = VerificationCodeAcquisitionResponse
    var path: String {
        return "api/code/getcode"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramater: [String : Any]?
    
    init(time: Int, token: String, name: String, isExist: Int, type: Int) {
        paramater = ["time": time , "token": token, "name": name, "is_exist": isExist, "type": type]
    }
    
}
