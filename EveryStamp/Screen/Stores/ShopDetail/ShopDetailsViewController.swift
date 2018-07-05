//
//  ShopDetailsViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/23.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class ShopDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = ShopDetailsViewModel()
    var shopDetailData: UserShopGetDetailData?
    var disposebag: DisposeBag = DisposeBag()
    var shopId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(cellType: ShopDetailsTC.self)
        
        viewModel.getShopDetailData(shop_id: shopId, is_all: 0).subscribe(onNext: {[weak self] response in
            guard let `self` = self else { return }
            self.shopDetailData = response.data
            self.tableView.reloadData()
        }).disposed(by: disposebag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ShopDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShopDetailsTC = tableView.dequeueReusableCell(for: indexPath)
        let opentime = "营业时间：" + (shopDetailData?.open_begin_time?.getHHmmByTimeStamp() ?? "") + " 至 " + (shopDetailData?.open_end_time?.getHHmmByTimeStamp() ?? "")
        let ruleOne = "1." + (shopDetailData?.point_rules ?? "")
        let ruleTwo = "2." + (shopDetailData?.min_stamp_rules ?? "")
        let stampTime = "3.活动日期" + (shopDetailData?.stamp_begin_time?.getDateByTimeStamp() ?? "") + "-" + (shopDetailData?.stamp_end_time?.getDateByTimeStamp() ?? "")
        let phone = "电话："
        let uiData: ShopDetailModel = ShopDetailModel(shopIcon: shopDetailData?.sign_url ?? "", shopName: shopDetailData?.name ?? "", address: shopDetailData?.address ?? "", openTime: opentime, phone: phone, detail: shopDetailData?.desp ?? "", ruleOne: ruleOne, ruleTwo: ruleTwo, ruleThree: stampTime)
        cell.refreshUI(model: uiData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}
