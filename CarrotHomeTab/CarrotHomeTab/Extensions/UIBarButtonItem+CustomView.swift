//
//  UIBarButtonItem+CustomView.swift
//  CarrotHomeTab
//
//  Created by ChoiKwangWoo on 2023/04/02.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat?) -> UIBarButtonItem {
        let customView = CustomBarItem(config: config)
        
        if let width = width {
            NSLayoutConstraint.activate([
                customView.widthAnchor.constraint(equalToConstant: width)
            ])
        }
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        return barButtonItem
    }
}
