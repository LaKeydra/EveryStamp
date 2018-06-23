//
//  RequestAPIManager.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/23.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class RequestAPIManager: NSObject {
    static let shared = RequestAPIManager()
    
    func requestAPIBaseUrl() -> String {
        return "https://api.everystamp.cc"
    }
    
    func requestAPITimeAndToken() -> [String: String] {
        var dic: [String: String] = [:]
        let now = Date()
        let timeInterval: TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(describing: Int(timeInterval))
        let token = ("shop_api." + String.init(describing: timeStamp)).MD5()
        dic["time"] = timeStamp
        dic["token"] = token
        return dic
    }
}
