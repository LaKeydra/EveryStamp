//
//  IntExtension.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/13.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

extension Int {
    func hexedString() -> String {
        return NSString(format: "%02x", self) as String
    }
}
