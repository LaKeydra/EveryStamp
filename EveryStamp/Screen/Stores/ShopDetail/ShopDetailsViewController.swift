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
    var shopDetailData: UserShopGetShortData?
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}
