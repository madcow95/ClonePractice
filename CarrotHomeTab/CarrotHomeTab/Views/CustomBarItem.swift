//
//  CustomBarItem.swift
//  CarrotHomeTab
//
//  Created by ChoiKwangWoo on 2023/04/02.
//

import Foundation
import UIKit

struct CustomBarItemConfiguration {
    
    typealias Handler = () -> Void
    
    let title: String?
    let image: UIImage?
    let handler: Handler
    
    // @escaping 검색
    init(title: String? = nil, image: UIImage? = nil, handler: @escaping Handler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
}

final class CustomBarItem: UIButton {
    // 필요한 항목
    // Title, Image, Action Handler
    
    var customBarItemConfig: CustomBarItemConfiguration
    init(config: CustomBarItemConfiguration) {
        self.customBarItemConfig = config
        super.init(frame: .zero)
        setupStyle()
        updateConfig()
        
    }
    
    private func setupStyle() {
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.titleLabel?.textColor = .white
        self.imageView?.tintColor = .white
    }
    
    private func updateConfig() {
        self.setTitle(customBarItemConfig.title, for: .normal)
        self.setImage(customBarItemConfig.image, for: .normal)
    }
    
    // 이건 또 뭐여
    @objc func buttonTapped() {
        customBarItemConfig.handler()
    }
    
    // required init 검색해볼것
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}
