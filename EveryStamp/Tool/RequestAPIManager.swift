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
    var access_token: String = ""
    var userId: Int = 0
    var isLogin: Bool = false
    var userName: String = ""
    
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
    
    //有多处要用到的API
    func sendUserGetcodeRequest(name: String,isExist: Int, type: Int = 0, checkExist: Int = 1) -> Observable<UserGetCodeResponse> {
        let requestPM = RequestAPIManager.shared.requestAPITimeAndToken()
        return Observable.create({ observer -> Disposable in
            let request: UserGetCodeRequest = UserGetCodeRequest(time: requestPM["time"] ?? "", token: requestPM["token"] ?? "", name: name, isExist: isExist, type: type, checkExist: checkExist)
            let observable = RxSessionRequestSender().sendRequest(request).subscribe(onNext: { result in
                switch result {
                case .success(let value):
                    observer.onNext(value)
                case .failure(let error):
                    observer.onError(error)
                case .interrupt(let error):
                    observer.onError(error)
                }
            })
            
            return Disposables.create {
                return observable.dispose()
            }
        })
    }
}
