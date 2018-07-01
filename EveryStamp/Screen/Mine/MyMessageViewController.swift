//
//  MyMessageViewController.swift
//  EveryStamp
//
//  Created by zhaolin01 on 2018/6/25.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import Foundation

enum MsgType {
    case fromStampMsg
    case systemMsg
    case shopMsg
    case none
}

class MyMessageViewController: BaseViewController {
    
    @IBOutlet weak var findMsgBtn: UIButton!
    @IBOutlet weak var officialMsgBtn: UIButton!
    @IBOutlet weak var shopMsgBtn: UIButton!
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var distance: CGFloat = (UIScreen.main.bounds.width / 3 - 68) / 2
    var everyWidth: CGFloat = UIScreen.main.bounds.width / 3
    var fromStampMsgsData: [UserGetFromStampMsgsData] = []
    var systemMsgsData: [UserGetSystemMsgsData] = []
    var shopMsgsData: [UserGetShopMsgsData] = []
    var currentMsgType: MsgType = .fromStampMsg
    let viewModel = MyMessageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: MsgStatusTC.self)
        tableView.tableFooterView = UIView()
        self.requestFormStampMsgsData()
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
            self.currentMsgType = .fromStampMsg
            self.requestFormStampMsgsData()
        })
        
        _ = self.officialMsgBtn.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let `self` = self else { return }
            self.findMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.officialMsgBtn.setTitleColor(#colorLiteral(red: 0.9764705882, green: 0.4862745098, blue: 0.1607843137, alpha: 1), for: .normal)
            self.shopMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.selectView.snp.remakeConstraints({ maker in
                maker.left.equalToSuperview().offset(self.everyWidth + self.distance)
            })
            self.currentMsgType = .systemMsg
            self.requestSystemMsgsData()
        })
        
        _ = self.shopMsgBtn.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let `self` = self else { return }
            self.findMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.officialMsgBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.shopMsgBtn.setTitleColor(#colorLiteral(red: 0.9764705882, green: 0.4862745098, blue: 0.1607843137, alpha: 1), for: .normal)
            self.selectView.snp.remakeConstraints({ maker in
                maker.right.equalTo(self.shopMsgBtn.snp.right)
            })
            self.currentMsgType = .shopMsg
            self.requestShopMsgListData()
        })
    }
    
    func requestFormStampMsgsData() {
        self.viewModel.getFormStampMsgs().subscribe(onNext: {[weak self] response in
            guard let `self` = self else { return }
            self.fromStampMsgsData = response.data
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }, onError: { error in
                let err = error as NSError
                let str = RequestAPIErrorManager.shared.dealErrorStatusCode(statusCode: err.code)
                ToastView.instance.showToast(content: str)
        }).disposed(by: disposeBag)
    }
    
    func requestSystemMsgsData() {
        self.viewModel.getSystemMsgs(type: nil).subscribe(onNext: {[weak self] response in
            guard let `self` = self else { return }
            self.systemMsgsData = response.data
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }, onError: { error in
                let err = error as NSError
                let str = RequestAPIErrorManager.shared.dealErrorStatusCode(statusCode: err.code)
                ToastView.instance.showToast(content: str)
        }).disposed(by: disposeBag)
    }
    
    func requestShopMsgListData() {
        self.viewModel.getShopMsgList(type: nil).subscribe(onNext: {[weak self] response in
            guard let `self` = self else { return }
            self.shopMsgsData = response.data
            self.tableView.reloadData()
            //self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }, onError: { error in
                let err = error as NSError
                let str = RequestAPIErrorManager.shared.dealErrorStatusCode(statusCode: err.code)
                ToastView.instance.showToast(content: str)
        }).disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func gotoMsgDetailsViewController(title: String, time: String, icon: String, detail: String) {
        let sb = UIStoryboard.init(name: "MsgDetailsViewController", bundle: nil)
        let vc: MsgDetailsViewController = sb.instantiateInitialViewController() as! MsgDetailsViewController
        vc.titleText = title
        vc.time = time
        vc.icon = icon
        vc.detail = detail
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

extension MyMessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentMsgType {
        case .fromStampMsg:
            return fromStampMsgsData.count
        case .systemMsg:
            return systemMsgsData.count
        case .shopMsg:
            return shopMsgsData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MsgStatusTC = tableView.dequeueReusableCell(for: indexPath)
        var icon: UIImage = UIImage()
        var title: String = ""
        var content: String = ""
        var time: String = ""
        
        switch currentMsgType {
        case .fromStampMsg:
            let data = fromStampMsgsData[indexPath.row]
            let fromStampType = GetFromStampType(rawValue: data.type ?? "") ?? .none
            switch fromStampType {
            case .get:
                icon = #imageLiteral(resourceName: "message-suoqu")
                title = "索取"
                content = (data.user_name ?? "") + " 向您索取一枚 "
                    + (data.shop_name ?? "") + " 集章"
            case .give:
                icon = #imageLiteral(resourceName: "message-zengsong")
                title = "转赠"
                content = (data.user_name ?? "") + " 转赠给您一枚 "
                    + (data.shop_name ?? "") + " 集章"
            default:
                break
            }
            
            time = data.timestamp?.getDateByTimeStamp() ?? ""
            cell.refreshUI(icon: icon, title: title, content: content, time: time)
        case .systemMsg:
            let data = systemMsgsData[indexPath.row]
            icon = #imageLiteral(resourceName: "message-icon")
            title = data.name ?? ""
            content = data.img_alt ?? ""
            time = data.msg_time?.getDateByTimeStamp() ?? ""
            cell.refreshUI(icon: icon, title: title, content: content, time: time)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch currentMsgType {
        case .fromStampMsg:
            break
        case .systemMsg:
            let data = systemMsgsData[indexPath.row]
            self.gotoMsgDetailsViewController(title: data.name ?? "", time: data.msg_time?.getDateByTimeStamp() ?? "", icon: "", detail: data.img_alt ?? "")
        default:
            break
        }
    }
    
}
