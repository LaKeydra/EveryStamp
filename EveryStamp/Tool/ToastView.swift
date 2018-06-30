//
//  ToastView.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/7/1.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

import UIKit
//弹窗工具
class ToastView : NSObject{
    
    static var instance : ToastView = ToastView()
    
    var windows = UIApplication.shared.windows
    let rv = UIApplication.shared.keyWindow?.subviews.first as UIView!
    
    //显示加载圈圈
    func showLoadingView() {
        clear()
        let frame = CGRect(x: 0, y: 0, width: 78, height: 78)
        
        let loadingContainerView = UIView()
        loadingContainerView.layer.cornerRadius = 12
        loadingContainerView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.8)
        
        let indicatorWidthHeight :CGFloat = 36
        let loadingIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        loadingIndicatorView.frame = CGRect(x: frame.width/2 - indicatorWidthHeight/2, y: frame.height/2 - indicatorWidthHeight/2, width: indicatorWidthHeight, height: indicatorWidthHeight)
        loadingIndicatorView.startAnimating()
        loadingContainerView.addSubview(loadingIndicatorView)
        
        let window = UIWindow()
        window.backgroundColor = UIColor.clear
        window.frame = frame
        loadingContainerView.frame = frame
        
        window.windowLevel = UIWindowLevelAlert
        window.center = CGPoint(x: (rv?.center.x)!, y: (rv?.center.y)!)
        window.isHidden = false
        window.addSubview(loadingContainerView)
        
        windows.append(window)
        
    }
    
    //弹窗图片文字
    func showToast(content:String, duration:CFTimeInterval=1.5) {
        clear()
        let frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        let toastContainerView = UIView()
        toastContainerView.layer.cornerRadius = 5
        toastContainerView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.7)
        
        let toastContentView = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        toastContentView.font = UIFont.systemFont(ofSize: 13)
        toastContentView.textColor = UIColor.white
        toastContentView.text = content
        toastContentView.textAlignment = NSTextAlignment.center
        toastContainerView.addSubview(toastContentView)
        
        let window = UIWindow()
        window.backgroundColor = UIColor.clear
        window.frame = frame
        toastContainerView.frame = frame
        
        window.windowLevel = UIWindowLevelAlert
        window.center = CGPoint(x: rv!.center.x, y: rv!.center.y * 16/10)
        window.isHidden = false
        window.addSubview(toastContainerView)
        windows.append(window)
        
        toastContainerView.layer.add(AnimationUtil.getToastAnimation(duration: duration), forKey: "animation")
        
        perform(#selector(removeToast(sender:)), with: window, afterDelay: duration)
    }
    
    //移除当前弹窗
    @objc func removeToast(sender: AnyObject) {
        if let window = sender as? UIWindow {
            if let index = windows.index(of: window){
                windows.remove(at: index)
            }
        }
    }
    
    //清除所有弹窗
    func clear() {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        windows.removeAll(keepingCapacity: false)
    }
    
}
