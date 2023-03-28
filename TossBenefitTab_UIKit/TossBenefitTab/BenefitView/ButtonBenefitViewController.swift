//
//  ButtonBenefitViewController.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/28.
//

import UIKit

class ButtonBenefitViewController: UIViewController {

    var benefit: Benefit = .today
    var benefitDetail: BenefitDetails = .default
    
    @IBOutlet weak var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
        
        ctaButton.setTitle(benefit.ctaTitle, for: .normal)
    }
}
