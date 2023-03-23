//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/23.
//

import Foundation


struct MyPoint: Hashable {
    var point: Int
}

// 왜 굳이 이렇게 할까?
extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
