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
    @IBOutlet weak var tableView: UITableView!
    
    var disposebag: DisposeBag = DisposeBag()
    var data: [UserGetAllShopsData] = []
    var isLatlng: Bool = true
    let viewModel = StoreViewModel()
    let distance: CGFloat = ((UIScreen.main.bounds.width / 2) - 110) / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .selected)
        bind()
        tableView.register(cellType: ShopTC.self)
        tableView.register(cellType: ShopRecommendTC.self)
        tableView.separatorStyle = .none
        self.requestData()
    }
    
    func bind() {
        _ = searchBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            let storyboard = UIStoryboard(name: "SearchShopViewController", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()
            self.navigationController?.pushViewController(vc!, animated: true)
        }).disposed(by: disposebag)
    }
    
    func requestData() {
        if isLatlng {
            viewModel.getShopsByLatlng(page: 1, num: 20).subscribe(onNext: {[weak self] response in
                guard let `self` = self else { return }
                self.data = response.data
                self.tableView.reloadData()
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }).disposed(by: disposebag)
        } else {
            viewModel.getShopsByRecommend(num: 20, is_recommend: 1).subscribe(onNext: {[weak self] response in
                guard let `self` = self else { return }
                self.data = response.data
                self.tableView.reloadData()
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }).disposed(by: disposebag)
        }
    }
    
    
    func gotoDetailVC(shopid: Int) {
        let sb = UIStoryboard.init(name: "ShopDetailsViewController", bundle: nil)
        let vc: ShopDetailsViewController = sb.instantiateInitialViewController() as! ShopDetailsViewController
        vc.shopId = shopid
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shopId = Int(data[indexPath.row].shop_id ?? "") ?? 0
        self.gotoDetailVC(shopid: shopId)
    }
}
