//
//  RecoverPasswordViewModel.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/24.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class RecoverPasswordViewModel: NSObject {
    func sendUserRecoverPasswordRequest(userName: Int, pwd: String, code: Int) -> Observable<UserFindPwdResponse> {
        let requestPM = RequestAPIManager.shared.requestAPITimeAndToken()
        return Observable.create({ observer -> Disposable in
            let request: UserFindPwdRequest = UserFindPwdRequest(time: requestPM["time"] ?? "", token: requestPM["token"] ?? "", userName: userName, pwd: pwd, code: code)
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
