//
//  BaseViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/7/1.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class BaseViewController: UIViewController {
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyBoardGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        self.view.addGestureRecognizer(hideKeyBoardGR)
    }
    
    @objc func hideKeyBoard() {
        self.view.endEditing(true)
    }
    
    func gotoLogInViewController() {
        if !RequestAPIManager.shared.isLogin {
            let stoyboard = UIStoryboard.init(name: "LogInViewController", bundle: nil)
            let vc = stoyboard.instantiateInitialViewController()
            self.present(vc!, animated: true, completion: nil)
        }
    }
}
