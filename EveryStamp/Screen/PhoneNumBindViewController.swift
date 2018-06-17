//
//  PhoneNumBindViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/5/30.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class PhoneNumBindViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var bindBtn: UIButton!
    let screenW = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldStyle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTextFieldStyle() {
        let phoneLeftView = UIView(frame: CGRect(x: 0, y: 17, width: 42, height: 17))
        let phoneLeftImageView = UIImageView(frame: CGRect(x: 25, y: 0, width: 11, height: 17))
        phoneLeftImageView.image = #imageLiteral(resourceName: "phone-icon")
        phoneLeftView.addSubview(phoneLeftImageView)
        phoneTextField.leftView = phoneLeftView
        phoneTextField.leftViewMode = .always
        
        let msgLeftView = UIView(frame: CGRect(x: 0, y: 17, width: 46, height: 16))
        let msgLeftImageView = UIImageView(frame: CGRect(x: 23, y: 0, width: 16, height: 16))
        msgLeftImageView.image = #imageLiteral(resourceName: "验证码")
        msgLeftView.addSubview(msgLeftImageView)
        messageTextField.leftView = msgLeftView
        messageTextField.leftViewMode = .always
        
        let msgRightView = UIView(frame: CGRect(x: screenW - 100, y: 0, width: 110, height: 50))
        let msgRightLabel = UILabel(frame: CGRect(x: 0, y: 15, width: 1, height: 19))
        let msgRightBtn = UIButton(frame: CGRect(x: 16, y: 0, width: 74, height: 50))
        msgRightLabel.backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
        msgRightBtn.setTitle("获取验证码", for: .normal)
        msgRightBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 13)
        msgRightBtn.setTitleColor(#colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5333333333, alpha: 1), for: .normal)
        msgRightView.addSubview(msgRightLabel)
        msgRightView.addSubview(msgRightBtn)
        messageTextField.rightView = msgRightView
        messageTextField.rightViewMode = .always
    }
}
