//
//  AlertErrorManager.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/24.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class AlertErrorManager: NSObject {
    static let shared = AlertErrorManager()
    func alertCodeError(codeError: CodeErrorType) {
        switch codeError {
        case .noSend:
            DefaultWireframe.presentAlert(title: "验证码未发送", message: nil, cancelTitle: nil, doneTitle: nil, destructiveTitle: nil, doneBlock: nil, cancelBlock: nil)
        case .timeOut:
            DefaultWireframe.presentAlert(title: "验证码超时，有效期3分钟，请重新获取", message: nil, cancelTitle: nil, doneTitle: nil, destructiveTitle: nil, doneBlock: nil, cancelBlock: nil)
        case .invalid:
            DefaultWireframe.presentAlert(title: "验证码失效，请重新获取", message: nil, cancelTitle: nil, doneTitle: nil, destructiveTitle: nil, doneBlock: nil, cancelBlock: nil)
        case .unMatched:
            DefaultWireframe.presentAlert(title: "验证码不匹配", message: nil, cancelTitle: nil, doneTitle: nil, destructiveTitle: nil, doneBlock: nil, cancelBlock: nil)
        case .often:
            DefaultWireframe.presentAlert(title: "验证码发送过于频繁，一个用户30s一次", message: nil, cancelTitle: nil, doneTitle: nil, destructiveTitle: nil, doneBlock: nil, cancelBlock: nil)
        case .emailSendFail:
            DefaultWireframe.presentAlert(title: "邮箱验证码发送失败", message: nil, cancelTitle: nil, doneTitle: nil, destructiveTitle: nil, doneBlock: nil, cancelBlock: nil)
        case .phoneSendFail:
            DefaultWireframe.presentAlert(title: "手机验证码发送失败", message: nil, cancelTitle: nil, doneTitle: nil, destructiveTitle: nil, doneBlock: nil, cancelBlock: nil)
        case .none:
            break
        }
    }
}
