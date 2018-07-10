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
    var imgstr: String = ""
    var shopName: String = ""
    var type: GetFromStampType = .get
    var disposeBag: DisposeBag = DisposeBag()
    var stamp_msg_id: Int = 1
    var shop_id: Int = 0
    let viewModel = TransferViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    func bind() {
        if type == .get {
            _ = self.commitBtn.rx.tap.subscribe(onNext: { _ in
                let stamp_id = 0
                let to_uid = 0
                self.viewModel.sendUserDoNateStampRequest(shop_id: self.shop_id, stamp_id: stamp_id, to_uid: to_uid, stamp_msg_id: self.stamp_msg_id).subscribe(onNext: { response in
                    ToastView.instance.showToast(content: "爱客章: 转赠成功")
                }).disposed(by: self.disposeBag)
            }).disposed(by: disposeBag)
        }
    }
    
    func setupUI() {
        self.userNameL.text = userName
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
        case .give:
            icon.image = #imageLiteral(resourceName: "message-zengsong")
            numL.text = "+"
            commitBtn.setTitle("收下", for: .normal)
            despL.text = "在店铺集章活动中增加一枚章"
            detailL.text = "赠送您一枚" + shopName + "集章"
        default:
            icon.image = #imageLiteral(resourceName: "message-suoqu")
            numL.text = "-"
            commitBtn.setTitle("转赠", for: .normal)
            despL.text = "在店铺集章活动中减少一枚章"
            detailL.text = "向您索取一枚" + shopName + "集章"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
