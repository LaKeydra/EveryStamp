//
//  MsgStatusTC.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/30.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class MsgStatusTC: UITableViewCell, NibReusable {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func refreshUI(icon: String, title: String, content: String, time: String) {
        self.titleLabel.text = title
        self.contentLabel.text = content
        self.timeLabel.text = time
        let url = RequestAPIManager.shared.requestAPIBaseUrl() + icon
        
        self.icon.kf.setImage(with: URL.init(string: url), placeholder: nil, options: nil, progressBlock: nil) {[weak self] (image, erroe, cacheType, url) in
            guard let `self` = self else { return }
            if image != nil {
                self.icon.image = image
            } else {
                self.icon.image = #imageLiteral(resourceName: "login_bg")
            }
        }
    }
    
}
