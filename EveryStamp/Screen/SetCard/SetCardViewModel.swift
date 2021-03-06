//
//  SetCardViewModel.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/22.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation


class SetCardViewModel: NSObject {
    func getCollectShopsRequest(page: Int = 1, num: Int = 20) -> Observable<UserGetCollectShopsResponse> {
        let requestPM = RequestAPIManager()
        return Observable.create({ observer -> Disposable in
            let request: UserGetCollectShopsRequest = UserGetCollectShopsRequest(accessToken: requestPM.access_token, userId: requestPM.userId, page: page, num: num)
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
