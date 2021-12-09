//
//  ViewController.swift
//  realmTestApp
//
//  Created by 김주영 on 2021/12/09.
//

import UIKit
import RealmSwift

let cellID = "MarketListTableViewCell"

class ViewController: UIViewController {
    
    var realm: Realm!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var naviBar: UINavigationBar!
    
    var markets: Results<RestaurantInfo>!
    
    var market: [RestaurantInfo] = [
        RestaurantInfo(name: "도미노피자", score: 4.8, subtitle: "포테이토 피자, 페페로니 피자", leastOrder: 15000, deliveryTip1: 2000, deliveryTip2: 4000, time1: 30, time2: 50, type: "피자"),
        RestaurantInfo(name: "청년피자", score: 4.8, subtitle: "포테이토 피자, 페페로니 피자", leastOrder: 15000, deliveryTip1: 2000, deliveryTip2: 4000, time1: 30, time2: 50, type: "피자"),
        RestaurantInfo(name: "혼밥대왕 광교점", score: 4.7, subtitle: "제주흑돼지김치찌개", leastOrder: 8400, deliveryTip1: 1000, deliveryTip2: 3000, time1: 40, time2: 55, type: "한식"),
        RestaurantInfo(name: "비비몰랭 본점", score: 4.9, subtitle: "고기덮밥+냉면", leastOrder: 8000, deliveryTip1: 2000, deliveryTip2: 3000, time1: 44, time2: 59, type: "한식"),
        RestaurantInfo(name: "파스타입니다 광교중앙점", score: 5.0, subtitle: "매콤크림 파스타", leastOrder: 8000, deliveryTip1: 1000, deliveryTip2: 3000, time1: 49, time2: 64, type: "양식"),
        RestaurantInfo(name: "덕꾼오리바베큐 광교점", score: 4.9, subtitle: "1인 세트", leastOrder: 12000, deliveryTip1: 0, deliveryTip2: 3500, time1: 43, time2: 58, type: "한식"),
        RestaurantInfo(name: "제육의신 본점", score: 4.7, subtitle: "불향제육", leastOrder: 7900, deliveryTip1: 0, deliveryTip2: 3000, time1: 49, time2: 64, type: "한식"),
        RestaurantInfo(name: "동명카츠 수원광교점", score: 4.9, subtitle: "나홀로 안심도시락", leastOrder: 9000, deliveryTip1: 1900, deliveryTip2: 4000, time1: 47, time2: 59, type: "일식"),
        RestaurantInfo(name: "제일상회 닭볶음탕 전문점", score: 3.9, subtitle: "무뼈1인닭볶음탕", leastOrder: 12000, deliveryTip1: 3500, deliveryTip2: 4000, time1: 39, time2: 54, type: "한식")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        realm = try! Realm()
        try! realm.write{
            realm.add(market)
        }
        self.naviBar.topItem?.title = "1인분"
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }

    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MarketListTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let info = realm.objects(RestaurantInfo.self)
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? MarketListTableViewCell else {
            return UITableViewCell()
        }
        let info = realm.objects(RestaurantInfo.self)
        cell.updateUI(cellData: info[indexPath.row])
        return cell
    }
    
    
}
