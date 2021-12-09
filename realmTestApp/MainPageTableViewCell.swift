//
//  MainPageTableViewCell.swift
//  realmTestApp
//
//  Created by 김주영 on 2021/12/09.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var marketImageView: UIImageView!
    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var marketScore: UILabel!
    @IBOutlet weak var marketDeliveryInfo: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var backView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 20
        backView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(cellData: RestaurantInfo) {
        marketImageView.image = UIImage(named: "\(cellData.name)banner")
        marketName.text = cellData.name
        marketScore.text = String(cellData.score)
        marketDeliveryInfo.text = "최소주문 \(cellData.leastOrder), 배달팁 \(cellData.deliveryTip1)~\(cellData.deliveryTip2)원"
        subtitle.text = cellData.type
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16.0, left: 0, bottom: 0, right: 0))
    }
}
