//
//  MyMessageViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/25.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

class MyMessageViewController: BaseViewController {
    
    @IBOutlet weak var findMsgBtn: UIButton!
    @IBOutlet weak var officialMsgBtn: UIButton!
    @IBOutlet weak var shopMsgBtn: UIButton!
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var distance: CGFloat = (UIScreen.main.bounds.width / 3 - 68) / 2
    var everyWidth: CGFloat = UIScreen.main.bounds.width / 3
    var data: [String] = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: MsgStatusTC.self)
        bind()
    }
    
    func bind() {
        self.selectView.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().offset(distance)
        })
        
        _ = self.findMsgBtn.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let `self` = self else { return }
            self.findMsgBtn.setTitleColor(#colorLiteral(red: 0.9764705882, green: 0.4862745098, blue: 0.1607843137, alpha: 1), for: .normal)
            self.officialMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.shopMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.selectView.snp.remakeConstraints({ maker in
                maker.left.equalToSuperview().offset(self.distance)
            })
        })
        
        _ = self.officialMsgBtn.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let `self` = self else { return }
            self.findMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.officialMsgBtn.setTitleColor(#colorLiteral(red: 0.9764705882, green: 0.4862745098, blue: 0.1607843137, alpha: 1), for: .normal)
            self.shopMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.selectView.snp.remakeConstraints({ maker in
                maker.left.equalToSuperview().offset(self.everyWidth + self.distance)
            })
        })
        
        _ = self.shopMsgBtn.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let `self` = self else { return }
            self.findMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.officialMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.shopMsgBtn.setTitleColor(#colorLiteral(red: 0.9764705882, green: 0.4862745098, blue: 0.1607843137, alpha: 1), for: .normal)
            self.selectView.snp.remakeConstraints({ maker in
                maker.right.equalTo(self.shopMsgBtn.snp.right)
            })
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MyMessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MsgStatusTC = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
}
