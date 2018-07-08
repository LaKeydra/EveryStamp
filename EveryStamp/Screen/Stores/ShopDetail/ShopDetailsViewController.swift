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
    var titles: [String] = []
    var imgs: [String] = []
    var disposebag: DisposeBag = DisposeBag()
    var shopId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(cellType: ShopDetailsTC.self)
        self.tableView.register(cellType: StoreHighlightsCell.self)
        
        viewModel.getShopDetailData(shop_id: shopId, is_all: 1).subscribe(onNext: {[weak self] response in
            guard let `self` = self else { return }
            self.shopDetailData = response.data
            self.titles = (response.data?.img_alts?.split(separator: "]") ?? []).map(String.init)
            
            for (index, _) in self.titles.enumerated() {
                self.titles[index].removeLast()
                self.titles[index].removeLast()
            }

            self.imgs = (response.data?.img_urls?.split(separator: ";") ?? []).map(String.init)
            self.tableView.reloadData()
        }).disposed(by: disposebag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ShopDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + self.imgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: ShopDetailsTC = tableView.dequeueReusableCell(for: indexPath)
            let opentime = "营业时间：" + (shopDetailData?.open_begin_time?.getHHmmByTimeStamp() ?? "") + " 至 " + (shopDetailData?.open_end_time?.getHHmmByTimeStamp() ?? "")
            let ruleOne = "1." + (shopDetailData?.point_rules ?? "")
            let ruleTwo = "2." + (shopDetailData?.min_stamp_rules ?? "")
            let stampTime = "3.活动日期" + (shopDetailData?.stamp_begin_time?.getDateByTimeStamp() ?? "") + "-" + (shopDetailData?.stamp_end_time?.getDateByTimeStamp() ?? "")
            let phone = "电话："
            let uiData: ShopDetailModel = ShopDetailModel(shopIcon: shopDetailData?.sign_url ?? "", shopName: shopDetailData?.name ?? "", address: shopDetailData?.address ?? "", openTime: opentime, phone: phone, detail: shopDetailData?.desp ?? "", ruleOne: ruleOne, ruleTwo: ruleTwo, ruleThree: stampTime)
            cell.refreshUI(model: uiData)
            return cell
        } else {
            let cell: StoreHighlightsCell = tableView.dequeueReusableCell(for: indexPath)
            let imgstr = self.imgs[indexPath.row - 1]
            let titlestr = self.titles[indexPath.row - 1]
            cell.refreshUI(img: imgstr, introducText: titlestr)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableViewAutomaticDimension
        } else {
            return 286
        }
    }
    
}
