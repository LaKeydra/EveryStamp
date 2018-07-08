//
//  SetChapterCardTC.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/24.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation
import Kingfisher

class SetChapterCardTC: UITableViewCell, NibReusable {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var addressL: UILabel!
    @IBOutlet weak var detailL: UILabel!
    @IBOutlet weak var currentL: UILabel!
    @IBOutlet weak var totalNumL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func refreshUI(icon: String, shopNameText: String,addressText: String, detail: String, currentNum: String, totalNum: String) {
        
        self.nameL.text = shopNameText
        self.addressL.text = addressText
        self.detailL.text = detail
        self.currentL.text = currentNum
        self.totalNumL.text = totalNum
        let url = RequestAPIManager.requestAPIBaseUrl() + icon
        
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
