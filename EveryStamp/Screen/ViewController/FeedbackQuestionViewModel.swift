//
//  FeedbackQuestionViewModel.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/7/8.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class FeedbackQuestionViewModel: NSObject {
    func feedbackQuestionRequest(contact: String, content: String) -> Observable<UserFeedbackResponse> {
        let requestPM = RequestAPIManager()
        return Observable.create({ observer -> Disposable in
            let request: UserFeedbackRequest = UserFeedbackRequest(access_token: requestPM.access_token, contact: contact, content: content, from: "ios", user_id: requestPM.userId)
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
