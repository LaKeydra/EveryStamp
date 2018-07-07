//
//  LogInViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/24.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class LogInViewController: BaseViewController {
    
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var forgetPWBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    var disposebag: DisposeBag = DisposeBag()
    let viewModel: LogInViewModel = LogInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    func bind() {
        phoneTextField.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        pwTextfield.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        _ = dismissBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposebag)
        
        _ = registerBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            let sb = UIStoryboard.init(name: "RegisterViewController", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            self.present(vc!, animated: true, completion: nil)
        }).disposed(by: disposebag)
        
        _ = forgetPWBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            let sb = UIStoryboard.init(name: "RecoverPasswordViewController", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            self.present(vc!, animated: true, completion: nil)
        }).disposed(by: disposebag)
        
        _ = loginBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            let userName: String = self.phoneTextField.text ?? ""
            let pwd: String = self.pwTextfield.text ?? ""
            self.viewModel.sendUserLoginRequest(userName: userName, pwd: pwd).subscribe(onNext: { response in
                let manager = UserDefaults.standard
                manager.set(true, forKey: "isLogin")
                manager.set(userName, forKey: "userName")
                manager.set(response.data?.accessToken ?? "", forKey: "access_token")
                manager.set(Int(response.data?.userId ?? "") ?? 0, forKey: "userId")
                manager.synchronize()
                ToastView.instance.showToast(content: "爱客章：登录成功")
                self.dismiss(animated: false, completion: nil)
            }, onError: { error in
                let err = error as NSError
                let str = RequestAPIErrorManager.shared.dealErrorStatusCode(statusCode: err.code)
                ToastView.instance.showToast(content: str)
            })
        }).disposed(by: disposebag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
}
