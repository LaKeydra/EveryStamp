//
//  SetCardViewController.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/22.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class SetCardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .selected)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
