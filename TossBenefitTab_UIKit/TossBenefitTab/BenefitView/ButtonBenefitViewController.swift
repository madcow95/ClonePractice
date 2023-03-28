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
    
    @IBOutlet weak var vStackView: UIStackView!
    @IBOutlet weak var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        setupUI()
        addGuides()
        
        ctaButton.setTitle(benefit.ctaTitle, for: .normal)
    }
    
    private func setupUI() {
        
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
    }
    
    private func addGuides() {
        let guideViews: [BenefitGuidView] = benefitDetail.guides.map{ guide in
            let guideView = BenefitGuidView(frame: .zero)
            guideView.icon.image = UIImage(systemName: guide.iconName)
            guideView.title.text = guide.guide
            
            return guideView
        }
        
        guideViews.forEach{ view in
            self.vStackView.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
}
