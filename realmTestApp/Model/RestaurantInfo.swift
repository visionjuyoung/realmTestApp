//
//  RestaurantInfo.swift
//  realmTestApp
//
//  Created by 김주영 on 2021/12/09.
//

import Foundation
import RealmSwift

class RestaurantInfo: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var score: Float = 0.0
    @objc dynamic var subtitle: String = ""
    @objc dynamic var leastOrder: Int = 0
    @objc dynamic var deliveryTip1: Int = 0
    @objc dynamic var deliveryTip2: Int = 0
    @objc dynamic var time1: Int = 0
    @objc dynamic var time2: Int = 0
    @objc dynamic var type: String = ""
    
    convenience init(name: String, score: Float, subtitle: String, leastOrder: Int, deliveryTip1: Int, deliveryTip2: Int, time1: Int, time2: Int, type: String) {
        self.init()
        self.name = name
        self.score = score
        self.subtitle = subtitle
        self.leastOrder = leastOrder
        self.deliveryTip1 = deliveryTip1
        self.deliveryTip2 = deliveryTip2
        self.time1 = time1
        self.time2 = time2
        self.type = type
    }
}
