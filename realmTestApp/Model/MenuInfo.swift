//
//  MenuInfo.swift
//  realmTestApp
//
//  Created by 김주영 on 2021/12/10.
//

import Foundation
import RealmSwift

class MenuInfo: Object {
    @objc dynamic var marketName: String = ""
    @objc dynamic var menuName: String = ""
    @objc dynamic var menuType: String = ""
    @objc dynamic var subtitle: String = ""
    @objc dynamic var price: Int = 0
    
    convenience init(marketName: String, menuName: String, menuType:String, subtitle: String, price: Int) {
        self.init()
        self.marketName = marketName
        self.menuName = menuName
        self.menuType = menuType
        self.subtitle = subtitle
        self.price = price
    }
}
