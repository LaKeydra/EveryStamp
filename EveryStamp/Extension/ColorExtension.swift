//
//  ColorExtension.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/25.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

extension UIColor {
    static func imageWithColor(color : UIColor) -> UIImage?{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
