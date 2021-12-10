//
//  menuTableViewCell.swift
//  realmTestApp
//
//  Created by 김주영 on 2021/12/10.
//

import UIKit

class menuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pizzaName: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(cellData: MenuInfo) {
        menuImageView.image = UIImage(named: "\(cellData.menuName)")
        pizzaName.text = cellData.menuName
        subLabel.text = ""
        price.text = "\(cellData.price)"
        title.text = cellData.subtitle
    }
}
