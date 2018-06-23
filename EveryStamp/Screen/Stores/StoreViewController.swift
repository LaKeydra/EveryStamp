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
    var latlngData: [UserGetAllShopsData] = []
    var recommendData: [UserGetAllShopsData] = []
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
//        self.tableView.es.addPullToRefresh {[unowned self] in
//            /// Do anything you want...
//            /// ...
//            /// Stop refresh when your job finished, it will reset refresh footer if completion is true
//            self.tableView.es.stopPullToRefresh(ignoreDate: true)
//            /// Set ignore footer or not
//            self.tableView.es.stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
//        }
//
//        self.tableView.es.addInfiniteScrolling {
//            [unowned self] in
//            /// Do anything you want...
//            /// ...
//            /// If common end
//            self.tableView.es.stopLoadingMore()
//            /// If no more data
//            self.tableView.es.noticeNoMoreData()
//        }
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
            viewModel.getShopsByLatlng().subscribe(onNext: {[weak self] response in
                guard let `self` = self else { return }
                self.latlngData = response.data
                self.tableView.reloadData()
            }).disposed(by: disposebag)
        } else {
            viewModel.getShopsByRecommend().subscribe(onNext: {[weak self] response in
                guard let `self` = self else { return }
                self.recommendData = response.data
                self.tableView.reloadData()
            }).disposed(by: disposebag)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLatlng {
            return latlngData.count
        } else {
            return recommendData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLatlng {
            let data = latlngData[indexPath.row]
            
            let cell: ShopTC = tableView.dequeueReusableCell(for: indexPath)
            cell.refreshUI(bgImg: "", shopNameText: data.name ?? "", shopIntroductText: data.desp ?? "", shopDetailText: data.desp ?? "")
            return cell
        } else {
            let data = recommendData[indexPath.row]
            let cell: ShopRecommendTC = tableView.dequeueReusableCell(for: indexPath)
            cell.refreshUI(shopImg: data.avator_url ?? "", shopName: data.name ?? "", shopAddress: data.address ?? "", rule: data.desp ?? "")
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
