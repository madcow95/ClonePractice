//
//  BenefitListViewModel.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/30.
//

import Foundation
import Combine

final class BenefitListViewModel {
    
    @Published var todaySectionItems: [AnyHashable] = []
    @Published var otherSectionItems: [AnyHashable] = []
    
    // 사용자 Interaction 관련
    let benefitDidTapped = PassthroughSubject<Benefit, Never>()
    let pointDidTapped = PassthroughSubject<MyPoint, Never>()
    
    func fetchItems() {
        // main thread에서 0.5초 후에 실행한다 network상으로 데이터를 받아올 때 이런식으로
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.todaySectionItems = TodaySectionItem(point: .default, today: .today).sectionItems
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.otherSectionItems = Benefit.others
        }
    }
}
