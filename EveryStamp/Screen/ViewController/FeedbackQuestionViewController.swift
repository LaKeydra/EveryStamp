//
//  FeedbackQuestionViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/3.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class FeedbackQuestionViewController: BaseViewController {
    
    
    @IBOutlet weak var contactTF: UITextField!
    @IBOutlet weak var contentTF: UITextField!
    @IBOutlet weak var commitBtn: UIButton!
    let viewModel = FeedbackQuestionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = commitBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            self.viewModel.feedbackQuestionRequest(contact: self.contactTF.text ?? "", content: self.contentTF.text ?? "").subscribe(onNext: { response in
                ToastView.instance.showToast(content: "爱客章：反馈成功")
            }, onError: { error in
                ToastView.instance.showToast(content: "爱客章：反馈失败")
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
        
    }
    
    
}
