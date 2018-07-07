//
//  RecoverPasswordViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/24.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation


class RecoverPasswordViewController: BaseViewController {
    
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var msgTextField: UITextField!
    @IBOutlet weak var getCodeBtn: UIButton!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var commitBtn: UIButton!
    var disposebag: DisposeBag = DisposeBag()
    let viewModel: RecoverPasswordViewModel = RecoverPasswordViewModel()
    
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
        
        _ = commitBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            //Mark:
            let userName = Int(self.phoneTextField.text ?? "") ?? 0
            let pwd: String = self.pwTextfield.text ?? ""
            let code = Int(self.msgTextField.text ?? "") ?? 0
            self.viewModel.sendUserRecoverPasswordRequest(userName: userName, pwd: pwd, code: code).subscribe(onNext: { response in
                ToastView.instance.showToast(content: "爱客章：找回密码成功")
                self.dismiss(animated: false, completion: nil)
            }, onError: { error in
                let err = error as NSError
                let str = RequestAPIErrorManager.shared.dealErrorStatusCode(statusCode: err.code)
                ToastView.instance.showToast(content: str)
            }).disposed(by: self.disposebag)
        }).disposed(by: disposebag)
        
        _ = getCodeBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            //MARK 发验证码
            self.getCodeBtn.countDown(count: 60)
            let name = self.phoneTextField.text ?? ""
            RequestAPIManager.shared.sendUserGetcodeRequest(name: name, isExist: 1).subscribe(onNext: { response in
                DDLogDebug("发送二维码成功")
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
