//
//  CustomButton.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/25.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    @IBInspectable var normalColor: UIColor = UIColor.white {
        didSet {
            self.setBackgroundImage(UIColor.imageWithColor(color: normalColor), for: .normal)
        }
    }
    
    @IBInspectable var highlightedColor: UIColor = UIColor.gray {
        didSet {
            self.setBackgroundImage(UIColor.imageWithColor(color: highlightedColor), for: .highlighted)
        }
    }
    
    @IBInspectable var disabledColor: UIColor = UIColor.gray {
        didSet {
            self.setBackgroundImage(UIColor.imageWithColor(color: disabledColor), for: .disabled)
        }
    }
    
    @IBInspectable var normalTextColor: UIColor = UIColor.black {
        didSet {
            self.setTitleColor(normalTextColor, for: .normal)
        }
    }
    
    @IBInspectable var selectedTextColor: UIColor = UIColor.orange {
        didSet {
            self.setTitleColor(selectedTextColor, for: .selected)
        }
    }
    
    @IBInspectable var disabledTextColor: UIColor = UIColor.gray {
        didSet {
            self.setTitleColor(disabledTextColor, for: .disabled)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
            self.layer.masksToBounds = true
        }
    }
    
}
