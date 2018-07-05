//
//  StoreHighlightsCell.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/7/4.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class StoreHighlightsCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var introductionL: UILabel!
    
    func refreshUI(img: String, introducText: String)  {
        self.introductionL.text = introducText
        
        let url = RequestAPIManager.shared.requestAPIBaseUrl() + img
        
        self.imgView.kf.setImage(with: URL.init(string: url), placeholder: nil, options: nil, progressBlock: nil) {[weak self] (image, erroe, cacheType, url) in
            guard let `self` = self else { return }
            if image != nil {
                self.imgView.image = image
            } else {
                self.imgView.image = #imageLiteral(resourceName: "login_bg")
            }
        }
    }
}
