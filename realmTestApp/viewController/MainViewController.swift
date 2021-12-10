//
//  MainViewController.swift
//  realmTestApp
//
//  Created by 김주영 on 2021/12/09.
//

import UIKit
import RealmSwift


class MainViewController: UIViewController {
    
    var realm: Realm!

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var mainPageTableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBanner()
        realm = try! Realm()
        setTableView()
        setbutton()
        button1.backgroundColor = UIColor(named: "baeminColor")
        button1.tintColor = .white
        self.naviBar.topItem?.title = "경기 수원시 영통구"
    }
    
    func setBanner() {
        let images: [UIImage] = [
            UIImage(named: "scrollBanner1")!,
            UIImage(named: "scrollBanner2")!,
            UIImage(named: "scrollBanner3")!,
            UIImage(named: "scrollBanner4")!
        ]
        
        bannerImageView.animationImages = images
        bannerImageView.animationDuration = 20
        bannerImageView.startAnimating()
        
    }
    
    func setTableView() {
        mainPageTableView.dataSource = self
        mainPageTableView.delegate = self
        mainPageTableView.register(UINib(nibName: "MainPageTableViewCell", bundle: nil), forCellReuseIdentifier: "MainPageTableViewCell")
    }
    
    func setbutton() {
        let buttons: [UIButton] = [button1, button2,button3,button4,button5,button6]
        
        for button in buttons {
            button.layer.cornerRadius = 10
            button.backgroundColor = .white
            button.tintColor = .systemGray4
        }
    }
    
    @IBAction func pressNaviButton(_ sender: UIButton) {
        setbutton()
        sender.backgroundColor = UIColor(named: "baeminColor")
        sender.tintColor = .white
    }
    
    
    @IBAction func onePersonSectionButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            return
        }
        present(vc, animated: false, completion: nil)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let info = realm.objects(RestaurantInfo.self)
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPageTableViewCell") as? MainPageTableViewCell else {
            return UITableViewCell()
        }
        let info = realm.objects(RestaurantInfo.self)
        cell.updateUI(cellData: info[indexPath.row])
        return cell
    }
}
