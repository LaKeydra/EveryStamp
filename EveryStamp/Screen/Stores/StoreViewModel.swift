//
//  StoreViewModel.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/22.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class StoreViewModel: NSObject {
    //附近商铺
    func getShopsByLatlng() -> Observable<UserGetAllShopsResponse> {
        let now = Date()
        let timeInterval: TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(describing: Int(timeInterval))
        let token = ("shop_api." + String.init(describing: timeStamp)).MD5()
        let lat: Float = Float(LocationManager.shared.currentLocation?.coordinate.latitude ?? 0)
        let lng: Float = Float(LocationManager.shared.currentLocation?.coordinate.longitude ?? 0)
        return Observable.create({ observer -> Disposable in
            let request: UserGetShopsByLatlngRequest = UserGetShopsByLatlngRequest(time: timeStamp, token: token, lat: lat, lng: lng, distance: 3000, page: 1, num: 20)
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
    
    //推荐商铺
    func getShopsByRecommend() -> Observable<UserGetAllShopsResponse> {
        let now = Date()
        let timeInterval: TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(describing: Int(timeInterval))
        let token = ("shop_api." + String.init(describing: timeStamp)).MD5()
        
        return Observable.create({ observer -> Disposable in
            let request: UserGetAllShopsRequest = UserGetAllShopsRequest(time: timeStamp, token: token, page: 1, num: 20, is_recommend: 1)
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
