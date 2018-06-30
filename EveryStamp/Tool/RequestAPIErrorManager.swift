//
//  RequestAPIErrorManager.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/30.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

enum ErrorStatusCode: Int {
    case success = 200
    case requestPMError = 400
    case bgOperationError = 401
    case incorrectRequest = 500
    case none
}

enum CodeErrorType: Int {
    case noSend = 400001
    case timeOut = 400002
    case invalid = 400003
    case unMatched = 400004
    case often = 400005
    case emailSendFail = 400006
    case phoneSendFail = 400007
    case none
}

class RequestAPIErrorManager: NSObject {
    static let shared = RequestAPIErrorManager()
    
    func dealErrorCode(code: Int) -> String {
        let type: CodeErrorType = CodeErrorType.init(rawValue: code) ?? .none
        switch type {
        case .noSend:
            return "验证码未发送"
        case .timeOut:
            return "验证码超时，有效期3分钟，请重新获取"
        case .invalid:
            return "验证码失效，请重新获取"
        case .unMatched:
            return "验证码不匹配"
        case .often:
            return "验证码发送过于频繁，一个用户30s一次"
        case .emailSendFail:
            return "邮箱验证码发送失败"
        case .phoneSendFail:
            return "手机验证码发送失败"
        default:
            return ""
        }
    }

    func dealErrorStatusCode(statusCode: Int) -> String {
        let code: ErrorStatusCode = ErrorStatusCode.init(rawValue: statusCode) ?? .none
        switch code {
        case .success:
            return "成功"
        case .requestPMError:
            return "请求参数错误"
        case .bgOperationError:
            return "后台操作错误"
        case .incorrectRequest:
            return "请求有误"
        default:
            return ""
        }
    }
    
    
}

