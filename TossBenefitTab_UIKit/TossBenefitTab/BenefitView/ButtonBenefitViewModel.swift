//
//  ButtonBenefitViewModel.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/30.
//

import Foundation

final class ButtonBenefitViewModel {
    
    @Published var benefit: Benefit?
    @Published var benefitDetail: BenefitDetails?
    
    init(benefit: Benefit? = nil) {
        self.benefit = benefit
    }
    
    func fetchDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.benefitDetail = .default
        }
        
    }
}
