//
//  SetChapterViewController.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/22.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class SetChapterViewController: UIViewController {
    
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var duringView: UIView!
    @IBOutlet weak var endView: UIView!
    @IBOutlet weak var startSetChapterBtn: UIButton!
    let disPoseBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .selected)
        
        let tap = startSetChapterBtn.rx.tap
        tap.subscribe(onNext: { _ in
            let sb = UIStoryboard(name: "BeginningChapterViewController", bundle: nil)
            let vc = sb.instantiateInitialViewController()
            self.navigationController?.pushViewController(vc!, animated: true)
        }).disposed(by: disPoseBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startView.isHidden = true
        duringView.isHidden = true
        endView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sleep(1)
        UIView.animate(withDuration: CATransaction.animationDuration()) {
            self.startView.isHidden = false
        }
        UIView.animate(withDuration: CATransaction.animationDuration()) {
            self.duringView.isHidden = false
        }
        UIView.animate(withDuration: CATransaction.animationDuration()) {
            self.endView.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
