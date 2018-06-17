//
//  RequestSender.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
//
import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
    case interrupt(Error)
    
    func map<T>(_ transform: (Value) throws -> T) -> Result<T> {
        switch self {
        case .success(let object):
            do {
                let nextObject = try transform(object)
                return Result<T>.success(nextObject)
            } catch {
                return Result<T>.failure(error)
            }
        case .failure(let error):
            return Result<T>.failure(error)
        case .interrupt(let error):
            return Result<T>.interrupt(error)
        }
    }
    
    func mapValue<T, K>(_ transform: @escaping (T) throws -> K) -> (Result<T>) -> Result<K> {
        return { result in
            result.map(transform)
        }
    }
}

protocol RequestSender {
    
    func sendRequest<T:Request>(_ r: T) -> Observable<Result<T.Response>>
}
