//
//  RegisterViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/24.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var msgTextField: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var getCodeBtn: UIButton!
    var disposebag: DisposeBag = DisposeBag()
    let viewModel: RegisterViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        phoneTextField.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        msgTextField.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        pwTextfield.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        _ = dismissBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposebag)
        
        _ = registerBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            //MARK API
            let userName: String = self.phoneTextField.text ?? ""
            let pwd: String = self.pwTextfield.text ?? ""
            let code = Int(self.msgTextField.text ?? "") ?? 0
            self.viewModel.sendUserRegisterRequest(userName: userName, pwd: pwd, code: code).subscribe(onNext: { response in
                ToastView.instance.showToast(content: "爱客章：注册成功")
                self.dismiss(animated: false, completion: nil)
            }, onError: { error in
                let err = error as NSError
                let str = RequestAPIErrorManager.shared.dealErrorStatusCode(statusCode: err.code)
                ToastView.instance.showToast(content: str)
            }).disposed(by: self.disposebag)
        }).disposed(by: disposebag)
        
        _ = loginBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            let sb = UIStoryboard.init(name: "LogInViewController", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            self.present(vc!, animated: true, completion: nil)
        }).disposed(by: disposebag)
        
        _ = getCodeBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            //MARK 发验证码
            self.getCodeBtn.countDown(count: 60)
            let name = self.phoneTextField.text ?? ""
            RequestAPIManager.shared.sendUserGetcodeRequest(name: name, isExist: 0).subscribe(onNext: { response in
                DDLogDebug("发送验证码成功")
            }, onError: { error in
                let err = error as NSError
                let str = RequestAPIErrorManager.shared.dealErrorCode(code: err.code)
                ToastView.instance.showToast(content: str)
            }).disposed(by: self.disposebag)
        }).disposed(by: disposebag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
