//
//  RxSessionRequestSender.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/10.
//  Copyright © 2018年 zhaolin. All rights reserved.
struct RxSessionRequestSender: RequestSender {
    
    internal func sendRequest<T : Request>(_ request: T) -> Observable<Result<T.Response>> {
        return self.send(request).flatMap{ result -> Observable<Result<T.Response>> in
            switch result {
            case .success(let res):
                return Observable.just(Result.success(res))
            case .failure(let error):
                return Observable.just(Result.failure(error))
            case .interrupt(let error):
                return Observable.just(Result.interrupt(error))
            }
        }
    }
    
    private func send<T : Request>(_ r: T) -> Observable<Result<T.Response>> {
        let url = r.baseURL.appendingPathComponent(r.path)
        let sessionManager = SessionManager.default
        self.debugDescription(r.method, url, parameters: r.paramater, headers: r.headerFields)
        return sessionManager
            .rx.request(r.method,
                        url,
                        parameters: r.paramater,
                        encoding: r.encoding,
                        headers: r.headerFields)
            .flatMap{ dataRequest -> Observable<(HTTPURLResponse, Data)> in
                return dataRequest.rx.responseData()
            }
            .flatMap{ (responseHeader, responseData) -> Observable<Result<T.Response>> in
                
                DDLogDebug("[StatusCode]: \(url) \n \(responseHeader.statusCode)")
                var error: NSError!
                if responseHeader.statusCode == 200 {
                    let jsonData = JSON(responseData).dictionaryObject
                    let code: Int = jsonData!["code"] as! Int
                    if code == 200 {
                        let res = T.Response.parse(data: jsonData as Any)
                        return Observable.just(Result.success(res))
                    } else {
                        error = NSError(domain: AppErrorDomain, code: code, userInfo: nil)
                        return Observable.just(Result.failure(error as Error))
                    }
                } else {
                    error = NSError(domain: AppErrorDomain, code: responseHeader.statusCode, userInfo: nil)
                    return Observable.just(Result.failure(error as Error))
                }
            }
            .catchError{e -> Observable<Result<T.Response>> in
                return Observable.just(Result.failure(e))
        }
        
    }
    
    
    func debugDescription(_ method: Alamofire.HTTPMethod, _ url: URLConvertible,
                          parameters: [String : Any]?, headers: [String : String]) {
        var output: [String] = []
        
        output.append("[Request]: \(method) \(url)")
        output.append("[Header]: \(headers)")
        
        if let param = parameters {
            output.append("[Parameter]: \(param)")
        } else {
            output.append("[Parameter]: null")
        }
        
        let outputString = output.joined(separator: "\n")
        
        DDLogDebug(outputString)
    }
}
