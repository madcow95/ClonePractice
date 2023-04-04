//
//  ItemInfoCell.swift
//  CarrotHomeTab
//
//  Created by ChoiKwangWoo on 2023/04/03.
//

import UIKit

class ItemInfoCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numOfChatLabel: UILabel!
    @IBOutlet weak var numOfLikeLabel: UILabel!
    
    func configure(item: ItemInfo) {
        print("InfoCell item >>>> \(item)")
//        thumbnailImageView.image = UIImage(named: item.)
        titleLabel.text = item.title
        descLabel.text = item.location
        priceLabel.text = "\(item.price)원"
        numOfChatLabel.text = "\(item.numOfChats)"
        numOfLikeLabel.text = "\(item.numOfLikes)"
    }
}
