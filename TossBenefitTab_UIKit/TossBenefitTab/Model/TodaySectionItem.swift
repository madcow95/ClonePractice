//
//  TodaySectionItem.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/23.
//

import Foundation

struct TodaySectionItem {
    var point: MyPoint
    let today: Benefit
    
    var sectionItem: [AnyHashable] {
        return [point, today]
    }
}

extension TodaySectionItem {
    static let mock = TodaySectionItem(point: MyPoint(point: 0), today: Benefit.walk)
}
