//
//  MarketListTableViewCell.swift
//  realmTestApp
//
//  Created by 김주영 on 2021/12/09.
//

import UIKit

class MarketListTableViewCell: UITableViewCell {

    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var marketImageView: UIImageView!
    @IBOutlet weak var marketScore: UILabel!
    @IBOutlet weak var marketSubTitle: UILabel!
    @IBOutlet weak var marketDeliveryInfo: UILabel!
    @IBOutlet weak var deliveryTime: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        marketImageView.layer.cornerRadius = 10
        
        deliveryTime.layer.cornerRadius = 10
        deliveryTime.backgroundColor = .systemGray6
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(cellData: RestaurantInfo) {
        marketImageView.image = UIImage(named: cellData.name)
        marketName.text = cellData.name
        marketScore.text = String(cellData.score)
        marketSubTitle.text = cellData.subtitle
        marketDeliveryInfo.text = "최소주문 \(cellData.leastOrder)원, 배달팁 \(cellData.deliveryTip1)~\(cellData.deliveryTip2)원"
        deliveryTime.text = "\(cellData.time1)~\(cellData.time2)분"
    }
}
