//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/27.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
    
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
