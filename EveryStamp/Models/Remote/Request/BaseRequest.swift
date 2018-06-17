//
//  BaseRequest.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//
import Foundation

let AppErrorDomain = "Error"

protocol BaseRequest: Request {
    
}

extension BaseRequest {
    var method: HTTPMethod {
        return .post
    }
    
    var baseURL: URL {
        return URL.init(string: "https://api.everystamp.cc")!
    }
    
    var headerFields: [String: String] {
        return ["Content-Type":"application/json"]
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var retryHandler: RequestRetrier? {
        return nil
    }
    
    var debugURL: URL? {
        return nil
    }
    
    var ignoreAlert: Bool {
        return false
    }
}
