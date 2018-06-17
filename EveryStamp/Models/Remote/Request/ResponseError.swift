//
//  ResponseError.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//
import Foundation
import Gloss

struct ResponseError : Decodable {
    let id:String?
    let message:String?
    let api:String?
    
    var errorCode:Int! {
        get {
            if let code = Int(self.id ?? "-999") {
                return code
            } else {
                return -999
            }
        }
    }
    
    init?(json:Gloss.JSON) {
        self.id = "id" <~~ json
        self.message = "message" <~~ json
        self.api = "api" <~~ json
    }
    
    static func parse(data: Any) -> ResponseError {
        if let json = data as? Gloss.JSON {
            return ResponseError(json: json)!
        }
        let unknownError = JSON()
        return ResponseError(json: unknownError)!
    }
}
