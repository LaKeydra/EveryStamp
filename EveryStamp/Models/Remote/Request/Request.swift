//
//  Request.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

protocol Decodable {
    static func parse(data: Any) -> Self
}

protocol Request {
    /// The response type associated with the request type.
    associatedtype Response: Decodable
    
    /// The base URL.
    var baseURL: URL { get }
    
    /// The HTTP request method.
    var method: HTTPMethod { get }
    
    /// The path URL component.
    var path: String { get }
    
    /// from this property depending on `method`.
    var paramater: [String: Any]? { get }
    
    /// The HTTP header fields. In addition to fields defined in this property, `Accept` and `Content-Type`
    /// fields will be added by `dataParser` and `bodyParameters`. If you define `Accept` and `Content-Type`
    /// in this property, the values in this property are preferred.
    var headerFields: [String: String] { get }
    
    /// A type used to define how a set of parameters are applied to a `URLRequest`.
    var encoding: ParameterEncoding { get }
    
    /// Debug URL
    var debugURL: URL? { get }
}
