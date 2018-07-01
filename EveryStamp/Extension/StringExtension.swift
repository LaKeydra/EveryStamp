//
//  StringExtension.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/13.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

// MARK: - Encryption MD5
extension String {
    func MD5() -> String {
        let data = (self as NSString).data(using: String.Encoding.utf8.rawValue)! as NSData
        return data.MD5().hexedString()
    }
    
    func getDateByTimeStamp() -> String {
        let timeStamp = Int(self)
        //转换为时间
        let timeInterval: TimeInterval = TimeInterval(timeStamp!)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dformatter.string(from: date)
    }
}
