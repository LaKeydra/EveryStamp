//
//  MineViewController.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/22.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {
    
    @IBOutlet weak var myMsgBtn: UIButton!
    @IBOutlet weak var feedbackQuestionBtn: UIButton!
    @IBOutlet weak var aboutUsBtn: UIButton!
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var userNameL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .selected)
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if RequestAPIManager.shared.isLogin {
            self.userNameL.text = RequestAPIManager.shared.userName
        }
    }
    
    func bind() {
        _ = self.navigationItem.rightBarButtonItem?.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            let sb = UIStoryboard(name: "SettingViewController", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            self.navigationController?.pushViewController(vc!, animated: true)
        })
        
        _ = self.myMsgBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            let sb = UIStoryboard(name: "MyMessageViewController", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            self.navigationController?.pushViewController(vc!, animated: true)
        })
        
        _ = self.feedbackQuestionBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            let sb = UIStoryboard(name: "FeedbackQuestionViewController", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            self.navigationController?.pushViewController(vc!, animated: true)
        })
        
        _ = self.aboutUsBtn.rx.tap.subscribe(onNext: {[weak self]  in
            guard let `self` = self else { return }
            let sb = UIStoryboard(name: "AboutUsViewController", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            self.navigationController?.pushViewController(vc!, animated: true)
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
