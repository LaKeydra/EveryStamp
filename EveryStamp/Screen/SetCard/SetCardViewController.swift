//
//  SetCardViewController.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/22.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class SetCardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel: SetCardViewModel = SetCardViewModel()
    var data: [UserGetCollectShopsData] = []
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .selected)
        tableView.register(cellType: SetChapterCardTC.self)
        requestData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func requestData() {
        self.viewModel.getCollectShopsRequest().subscribe(onNext: { [weak self] response in
            guard let `self` = self else { return }
            self.data = response.data
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension SetCardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SetChapterCardTC = tableView.dequeueReusableCell(for: indexPath)
        let uidata: UserGetCollectShopsData = data[indexPath.row]
        let currentNum = uidata.totalStampCount ?? ""
        let totalNum = "/ " + (uidata.maxStampCount ?? "")
        cell.refreshUI(icon: uidata.avatorUrl ?? "", shopNameText: uidata.name ?? "", addressText: uidata.address ?? "", detail: uidata.minStampRules ?? "", currentNum: currentNum, totalNum: totalNum)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "SetCardDetailsViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
