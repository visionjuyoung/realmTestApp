//
//  MarketViewController.swift
//  realmTestApp
//
//  Created by 김주영 on 2021/12/10.
//

import UIKit
import RealmSwift

class MarketViewController: UIViewController {

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deliveryInfoView: UIView!
    @IBOutlet weak var marketLabelView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var leastPayLabel: UILabel!
    @IBOutlet weak var deliveryTipLabel: UILabel!
    
    var newPizza: Results<MenuInfo>!
    var originalPizza: Results<MenuInfo>!
    var thinPizza: Results<MenuInfo>!
    var napoliPizza: Results<MenuInfo>!
    
    var realm: Realm!
    
    var marketName: String = ""
    var deliveryTip: Int = 0
    var leastOrderPrice: Int = 0
    
    var sectionHeader = ["신제품", "오리지널 도우", "씬 도우", "나폴리 도우"]
    
    var menu: [MenuInfo] = [
        MenuInfo(marketName: "도미노피자", menuName: "마스터 트리플 코스", menuType: "신제품", subtitle: "대표", price: 33900),
        MenuInfo(marketName: "도미노피자", menuName: "마스터 트리플 코스 트리플 치즈", menuType: "신제품", subtitle: "", price: 38900),
        MenuInfo(marketName: "도미노피자", menuName: "치즈 퐁듀 파이어 미트", menuType: "오리지널 도우", subtitle: "", price: 34900),
        MenuInfo(marketName: "도미노피자", menuName: "블록버스터", menuType: "오리지널 도우", subtitle: "", price: 35900),
        MenuInfo(marketName: "도미노피자", menuName: "뉴욕 오리진", menuType: "오리지널 도우", subtitle: "인기", price: 27900),
        MenuInfo(marketName: "도미노피자", menuName: "하와이안 슈림프", menuType: "오리지널 도우", subtitle: "", price: 27900),
        MenuInfo(marketName: "도미노피자", menuName: "베스트 콰트로 피자", menuType: "오리지널 도우", subtitle: "인기", price: 35900),
        MenuInfo(marketName: "도미노피자", menuName: "베이컨체더치즈 피자", menuType: "씬 도우", subtitle: "", price: 25900),
        MenuInfo(marketName: "도미노피자", menuName: "블랙앵거스 스테이크 피자", menuType: "씬 도우", subtitle: "", price: 34900),
        MenuInfo(marketName: "도미노피자", menuName: "블랙타이거 슈림프 피자", menuType: "씬 도우", subtitle: "", price: 26900),
        MenuInfo(marketName: "도미노피자", menuName: "슈퍼디럭스 피자", menuType: "나폴리 도우", subtitle: "", price: 28900),
        MenuInfo(marketName: "도미노피자", menuName: "슈퍼스프림 피자", menuType: "나폴리 도우", subtitle: "대표", price: 28900),
        MenuInfo(marketName: "도미노피자", menuName: "우리 고구마 피자", menuType: "나폴리 도우", subtitle: "", price: 28900),
        MenuInfo(marketName: "도미노피자", menuName: "리얼불고기 피자", menuType: "나폴리 도우", subtitle: "", price: 27900),
        MenuInfo(marketName: "도미노피자", menuName: "포테이토 피자", menuType: "나폴리 도우", subtitle: "대표", price: 25900)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewEffect()
        setTableView()
        realm = try! Realm()
        //print(realm.objects(MenuInfo.self))
        self.naviBar.topItem?.title = marketName
        leastPayLabel.text = "최소주문금액 \(leastOrderPrice)원"
        deliveryTipLabel.text = "배달팁 \(deliveryTip)원"
    }
    
    func setViewEffect() {
        deliveryInfoView.layer.borderWidth = 1
        deliveryInfoView.layer.borderColor = UIColor.systemGray4.cgColor
        marketLabelView.layer.cornerRadius = 10
        marketLabelView.layer.shadowColor = UIColor.black.cgColor
        marketLabelView.layer.masksToBounds = false
        marketLabelView.layer.shadowOffset = CGSize(width: 0, height: 2)
        marketLabelView.layer.shadowRadius = 8
        marketLabelView.layer.shadowOpacity = 0.1
        
    }
    
    func setTableView() {
        tableView.rowHeight = 120
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "menuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuTableViewCell")
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionHeader[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            let info = realm.objects(MenuInfo.self).filter("menuType == '신제품'")
            newPizza = info
            return info.count
        case 1:
            let info = realm.objects(MenuInfo.self).filter("menuType == '오리지널 도우'")
            originalPizza = info
            return info.count
        case 2:
            let info = realm.objects(MenuInfo.self).filter("menuType == '씬 도우'")
            thinPizza = info
            return info.count
        case 3:
            let info = realm.objects(MenuInfo.self).filter("menuType == '나폴리 도우'")
            napoliPizza = info
            return info.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell") as? menuTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.updateUI(cellData: newPizza[indexPath.row])
        } else if indexPath.section == 1 {
            cell.updateUI(cellData: originalPizza[indexPath.row])
        } else if indexPath.section == 2 {
            cell.updateUI(cellData: thinPizza[indexPath.row])
        } else if indexPath.section == 3 {
            cell.updateUI(cellData: napoliPizza[indexPath.row])
        }
        return cell
    }
    
    
}
