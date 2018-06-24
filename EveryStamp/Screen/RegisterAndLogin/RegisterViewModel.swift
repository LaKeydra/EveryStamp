//
//  RegisterViewModel.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/24.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class RegisterViewModel: NSObject {
    func sendUserRegisterRequest(userName: String, pwd: String, code: Int) -> Observable<UserRegisterResponse> {
        let requestPM = RequestAPIManager.shared.requestAPITimeAndToken()
        return Observable.create({ observer -> Disposable in
            let request: UserRegisterRequest = UserRegisterRequest(time: requestPM["time"] ?? "", token: requestPM["token"] ?? "", userName: userName, pwd: pwd, code: code, from: "ios")
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
