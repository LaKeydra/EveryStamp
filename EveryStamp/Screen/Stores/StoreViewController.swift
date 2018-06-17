//
//  StoreViewController.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/22.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var nearbyBtn: UIButton!
    @IBOutlet weak var recommendBtn: UIButton!
    @IBOutlet weak var selectedview: UIView!
    @IBOutlet weak var selectViewLeading: NSLayoutConstraint!
    
    var disposebag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .selected)
        
        self.selectViewLeading.constant = self.nearbyBtn.frame.origin.x
        
        _ = searchBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            let storyboard = UIStoryboard(name: "SearchShopViewController", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()
            self.navigationController?.pushViewController(vc!, animated: true)
        }).disposed(by: disposebag)
        
        _ = nearbyBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            UIView.animate(withDuration: CATransaction.animationDuration(), delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.selectViewLeading.constant = self.nearbyBtn.frame.origin.x
            }, completion: nil)
            
            
        }).disposed(by: disposebag)
        
        _ = recommendBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            UIView.animate(withDuration: CATransaction.animationDuration(), delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.selectViewLeading.constant = self.recommendBtn.frame.origin.x + (self.recommendBtn.superview?.frame.origin.x)!
            }, completion: nil)
        }).disposed(by: disposebag)
    }
    
    @IBAction func testAction(_ sender: Any) {
        let temp = request()
        temp.subscribe(onNext: { response in
            print(response)
        }).disposed(by: disposebag)
        
        
    }
    //    return Observable<Void>.create({observer -> Disposable in
    //    let request = SaveSettingRequest(subAppId: subAppId, settingList: settingData[2].rows)
    //    let observable =
    //    RxSessionRequestSender().sendRequest(request)
    //    .subscribe(onNext: { result in
    //    switch result {
    //    case .success:
    //    RealmManager.updateSetting(setting: settingData[2].rows)
    //    observer.onNext()
    //    case .failure(let error):
    //    observer.onError(error)
    //    case .interrupt(let error):
    //    observer.onError(error)
    //    }
    //    })
    //    return Disposables.create {
    //    observable.dispose()
    //    }
    //    })
    
    func request() -> Observable<UserLoginResponse> {
        let now = Date()
        let timeInterval: TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(describing: Int(timeInterval))
            //
        let token = ("shop_api." + String.init(describing: timeStamp)).MD5()
        
        return Observable.create({ observer -> Disposable in
            let request: UserLoginRequest = UserLoginRequest(time: timeStamp, token: token, userName: "15168366883", pwd: "123456".MD5(), from: "ios")
            let observable = RxSessionRequestSender().sendRequest(request).subscribe(onNext: { result in
                switch result {
                case .success(let result):
                    observer.onNext(result)
                case .failure(let error):
                    observer.onError(error)
                case .interrupt(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create {
                observable.dispose()
            }
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
