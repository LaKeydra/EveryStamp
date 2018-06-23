//
//  ShopDetailsViewModel.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/23.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class ShopDetailsViewModel: NSObject{
    func getShopDetailData(shop_id: Int, is_all: Int) -> Observable<UserShopGetResponse> {
        let requestPM = RequestAPIManager.shared.requestAPITimeAndToken()
        return Observable.create({ observer -> Disposable in
            let request: UserShopGetRequest = UserShopGetRequest(access_token: requestPM["token"] ?? "", shop_id: shop_id, is_all: is_all)
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
