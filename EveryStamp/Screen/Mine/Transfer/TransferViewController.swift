//
//  TransferViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/7/8.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class TransferViewController: UIViewController {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var userNameL: UILabel!
    @IBOutlet weak var detailL: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var shopNameL: UILabel!
    @IBOutlet weak var numL: UILabel!
    @IBOutlet weak var commitBtn: UIButton!
    @IBOutlet weak var despL: UILabel!
    var userName: String = ""
    var detail: String = ""
    var imgstr: String = ""
    var shopName: String = ""
    var type: viewControllerType = .get
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameL.text = userName
        self.detailL.text = detail
        self.shopNameL.text = shopName
        let url = RequestAPIManager.requestAPIBaseUrl() + imgstr
        
        self.img.kf.setImage(with: URL.init(string: url), placeholder: nil, options: nil, progressBlock: nil) {[weak self] (image, erroe, cacheType, url) in
            guard let `self` = self else { return }
            if image != nil {
                self.img.image = image
            } else {
                self.img.image = #imageLiteral(resourceName: "login_bg")
            }
        }
        
        switch type {
        case .get:
            icon.image = #imageLiteral(resourceName: "message-zengsong")
            numL.text = "+"
            commitBtn.setTitle("收下", for: .normal)
            despL.text = "在店铺集章活动中增加一枚章"
        default:
            icon.image = #imageLiteral(resourceName: "message-suoqu")
            numL.text = "-"
            commitBtn.setTitle("转赠", for: .normal)
            despL.text = "在店铺集章活动中减少一枚章"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

enum viewControllerType {
    case get
    case give
}
