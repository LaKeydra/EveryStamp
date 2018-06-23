//
//  ShopRecommendTC.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/23.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class ShopRecommendTC: UITableViewCell, NibReusable {
    
    @IBOutlet weak var shopImgV: UIImageView!
    @IBOutlet weak var shopNameL: UILabel!
    @IBOutlet weak var shopAddressL: UILabel!
    @IBOutlet weak var ruleL: UILabel!
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var giftBtn: UIButton!
    
    func refreshUI(shopImg: String, shopName: String, shopAddress: String, rule: String) {
        self.shopNameL.text = shopName
        self.shopAddressL.text = shopAddress
        self.ruleL.text = rule
        self.shopImgV.kf.setImage(with: URL.init(string: shopImg), placeholder: nil, options: nil, progressBlock: nil) {[weak self] (image, erroe, cacheType, url) in
            guard let `self` = self else { return }
            if image != nil {
                self.shopImgV.image = image
            } else {
                self.shopImgV.image = #imageLiteral(resourceName: "login_bg")
            }
        }
    }
}
