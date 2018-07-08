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
    func getShopsByLatlng(distance: Float = 3000, page: Int = 1, num: Int = 10) -> Observable<UserGetAllShopsResponse> {
        let requestPM = RequestAPIManager.requestAPITimeAndToken()
        
        let lat: Float = Float(LocationManager.shared.currentLocation?.coordinate.latitude ?? 0)
        let lng: Float = Float(LocationManager.shared.currentLocation?.coordinate.longitude ?? 0)
        return Observable.create({ observer -> Disposable in
            let request: UserGetShopsByLatlngRequest = UserGetShopsByLatlngRequest(time: requestPM["time"] ?? "", token: requestPM["token"] ?? "", lat: lat, lng: lng, distance: distance, page: page, num: num)
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
    func getShopsByRecommend(page: Int = 1, num: Int = 10, is_recommend: Int = 0) -> Observable<UserGetAllShopsResponse> {
         let requestPM = RequestAPIManager.requestAPITimeAndToken()
        
        return Observable.create({ observer -> Disposable in
            let request: UserGetAllShopsRequest = UserGetAllShopsRequest(time: requestPM["time"] ?? "", token: requestPM["token"] ?? "", page: page, num: num, is_recommend: is_recommend)
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
