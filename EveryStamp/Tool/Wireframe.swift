//
//  Wireframe.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/24.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class DefaultWireframe: NSObject {
    static let sharedInstance = DefaultWireframe()
    
    private static func rootViewController() -> UIViewController {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        } else {
            fatalError("No RootViewController")
        }
    }
    
    static func presentAlert(title: String? = nil,
                             message: String? = nil,
                             cancelTitle: String? = nil,
                             doneTitle: String? = nil,
                             destructiveTitle: String? = nil,
                             doneBlock: ((UIAlertAction) -> Void)? = nil,
                             cancelBlock: ((UIAlertAction) -> Void)? = nil) {
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let cancel = cancelTitle {
            alertView.addAction(UIAlertAction(title: cancel, style: .cancel, handler: cancelBlock))
        }
        
        if let destructive = destructiveTitle {
            alertView.addAction(UIAlertAction(title: destructive, style: .destructive, handler: doneBlock))
        } else {
            alertView.addAction(UIAlertAction(title: doneTitle ?? "OK", style: .default, handler: doneBlock))
        }
        
        let topController = rootViewController()
        if !topController.isKind(of: UIAlertController.classForCoder()) {
            topController.present(alertView, animated: true, completion: nil)
        }
    }
    
   
}
