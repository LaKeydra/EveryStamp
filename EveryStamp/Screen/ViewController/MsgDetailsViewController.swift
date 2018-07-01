//
//  MsgDetailsViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/7/1.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class MsgDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var detailL: UILabel!
    
    var titleText: String = ""
    var time: String = ""
    var icon: String = ""
    var detail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupUI() {
        titleLabel.text = titleText
        timeLabel.text = time
        detailL.text = detail
    }
}
