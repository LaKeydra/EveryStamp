//
//  ShopDetailsTC.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/23.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class ShopDetailsTC: UITableViewCell, NibReusable {
    
    @IBOutlet weak var shopIcon: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var openTimeL: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var detailL: UILabel!
    @IBOutlet weak var ruleOneL: UILabel!
    @IBOutlet weak var ruleTwoL: UILabel!
    @IBOutlet weak var ruleThreeL: UILabel!
    @IBOutlet weak var noCollectBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func refreshUI(model: ShopDetailModel) {
        self.shopName.text = model.shopName
        self.addressLabel.text = model.address
        self.openTimeL.text = model.openTime
        self.phoneLabel.text = model.phone
        self.detailL.text = model.detail
        self.ruleOneL.text = model.ruleOne
        self.ruleTwoL.text = model.ruleTwo
        self.ruleThreeL.text = model.ruleThree
        
        let url = RequestAPIManager.requestAPIBaseUrl() + model.shopIcon
        
        self.shopIcon.kf.setImage(with: URL.init(string: url), placeholder: nil, options: nil, progressBlock: nil) {[weak self] (image, erroe, cacheType, url) in
            guard let `self` = self else { return }
            if image != nil {
                self.shopIcon.image = image
            } else {
                self.shopIcon.image = #imageLiteral(resourceName: "login_bg")
            }
        }
    }
}

struct ShopDetailModel {
    var shopIcon: String
    var shopName: String
    var address: String
    var openTime: String
    var phone: String
    var detail: String
    var ruleOne: String
    var ruleTwo: String
    var ruleThree: String
}
