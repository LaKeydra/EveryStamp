//
//  ShopTC.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/23.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Kingfisher

class ShopTC: UITableViewCell, NibReusable {
    
    @IBOutlet weak var bgImgV: UIImageView!
    @IBOutlet weak var shopNameL: UILabel!
    @IBOutlet weak var shopIntroductionL: UILabel!
    @IBOutlet weak var shopDetailL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func refreshUI(bgImg: String, shopNameText: String, shopIntroductText: String, shopDetailText: String) {
        
        self.shopNameL.text = shopNameText
        self.shopIntroductionL.text = shopIntroductText
        self.shopDetailL.text = shopDetailText
        let url = RequestAPIManager.shared.requestAPIBaseUrl() + bgImg
        
        self.bgImgV.kf.setImage(with: URL.init(string: url), placeholder: nil, options: nil, progressBlock: nil) {[weak self] (image, erroe, cacheType, url) in
            guard let `self` = self else { return }
            if image != nil {
                self.bgImgV.image = image
            } else {
                self.bgImgV.image = #imageLiteral(resourceName: "login_bg")
            }
        }
    }
}
