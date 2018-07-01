//
//  MyMessageViewModel.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/30.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class MyMessageViewModel: NSObject {
    //读取转赠索取消息
    func getFormStampMsgs(page: Int = 1, num: Int = 20) -> Observable<UserGetFromStampMsgsResponse> {
        let requestPM = RequestAPIManager.shared
        return Observable.create({ observer -> Disposable in
            let request: UserGetFromStampMsgsRequest = UserGetFromStampMsgsRequest(access_token: requestPM.access_token, user_id: requestPM.userId, page: page, num: num)
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
    
    //获取平台推送消息
    func getSystemMsgs(type: Int?) -> Observable<UserGetSystemMsgsResponse> {
        let requestPM = RequestAPIManager.shared
        return Observable.create({ observer -> Disposable in
            let request: UserGetSystemMsgsRequest = UserGetSystemMsgsRequest(access_token: requestPM.access_token, user_id: requestPM.userId, type: type)
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
    
    //获取店铺的消息列表
    func getShopMsgList(type: Int?, page: Int = 1, num: Int = 20) -> Observable<UserGetShopMsgsResponse> {
        let requestPM = RequestAPIManager.shared
        return Observable.create({ observer -> Disposable in
            let request: UserGetShopMsgsRequest = UserGetShopMsgsRequest(access_token: requestPM.access_token, user_id: requestPM.userId, type: type, page: page, num: num)
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


