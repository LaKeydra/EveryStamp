//
//  StoreViewController.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/22.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var nearbyBtn: UIButton!
    @IBOutlet weak var recommendBtn: UIButton!
    @IBOutlet weak var selectedview: UIView!
    @IBOutlet weak var selectViewLeading: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var disposebag: DisposeBag = DisposeBag()
    var data: [UserGetAllShopsData] = []
    var isLatlng: Bool = true
    let viewModel = StoreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .selected)
        bind()
        tableView.register(cellType: ShopTC.self)
        tableView.register(cellType: ShopRecommendTC.self)
        tableView.separatorStyle = .none
        self.requestData()
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(gotoDetailVC))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func bind() {
        self.selectViewLeading.constant = self.nearbyBtn.frame.origin.x
        
        _ = searchBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            let storyboard = UIStoryboard(name: "SearchShopViewController", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()
            self.navigationController?.pushViewController(vc!, animated: true)
        }).disposed(by: disposebag)
        
        _ = nearbyBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            
            UIView.animate(withDuration: CATransaction.animationDuration(), delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.selectViewLeading.constant = self.nearbyBtn.frame.origin.x
            }, completion: { completion in
                if completion {
                    self.isLatlng = true
                    self.requestData()
                }
            })
            
            
        }).disposed(by: disposebag)
        
        _ = recommendBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            UIView.animate(withDuration: CATransaction.animationDuration(), delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.selectViewLeading.constant = self.recommendBtn.frame.origin.x + (self.recommendBtn.superview?.frame.origin.x)!
            }, completion: { completion in
                if completion {
                    self.isLatlng = false
                    self.requestData()
                }
            })
        }).disposed(by: disposebag)
    }
    
    func requestData() {
        if isLatlng {
            viewModel.getShopsByLatlng(page: 1, num: 20).subscribe(onNext: {[weak self] response in
                guard let `self` = self else { return }
                self.data = response.data
                self.tableView.reloadData()
            }).disposed(by: disposebag)
        } else {
            viewModel.getShopsByRecommend(num: 20, is_recommend: 1).subscribe(onNext: {[weak self] response in
                guard let `self` = self else { return }
                self.data = response.data
                self.tableView.reloadData()
            }).disposed(by: disposebag)
        }
    }
    
    
    @objc func gotoDetailVC() {
        let sb = UIStoryboard.init(name: "ShopDetailsViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let uiData = data[indexPath.row]
        if isLatlng {
            let cell: ShopTC = tableView.dequeueReusableCell(for: indexPath)
            cell.refreshUI(bgImg: uiData.sign_url ?? "", shopNameText: uiData.desp ?? "", shopIntroductText: uiData.name ?? "", shopDetailText: uiData.address ?? "")
            return cell
        } else {
            let cell: ShopRecommendTC = tableView.dequeueReusableCell(for: indexPath)
            cell.refreshUI(shopImg: uiData.sign_url ?? "", shopName: uiData.name ?? "", shopAddress: uiData.address ?? "", rule: uiData.desp ?? "")
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isLatlng {
            return 221
        } else {
            return 126
        }
        
    }
}
