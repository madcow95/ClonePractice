//
//  MyPointViewModel.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/30.
//

import Foundation

final class MyPointViewModel {
    
    @Published var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }
}
