//
//  TransferViewModel.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/7/9.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class TransferViewModel: NSObject {
    func sendUserDoNateStampRequest(shop_id: Int, stamp_id: Int, to_uid: Int, stamp_msg_id: Int) -> Observable<UserDoNateStampResponse> {
        let requestPM = RequestAPIManager()
        return Observable.create({ observer -> Disposable in
            let request: UserDoNateStampRequest = UserDoNateStampRequest(access_token: requestPM.access_token, user_id: requestPM.userId, shop_id: shop_id, stamp_id: stamp_id, to_uid: to_uid, stamp_msg_id: stamp_msg_id)
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
