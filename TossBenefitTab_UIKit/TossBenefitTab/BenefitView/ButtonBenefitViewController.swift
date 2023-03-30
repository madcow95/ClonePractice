//
//  ButtonBenefitViewController.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/28.
//

import UIKit
import Combine

class ButtonBenefitViewController: UIViewController {
    
    @IBOutlet weak var vStackView: UIStackView!
    @IBOutlet weak var ctaButton: UIButton!
    
    var viewModel: ButtonBenefitViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        setupUI()
        bind()
        viewModel.fetchDetails()
    }
    
    private func setupUI() {
        
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
    }
    
    private func bind() {
        
        // output: data
        viewModel.$benefit
            .receive(on: RunLoop.main)
            .sink { benefit in
                self.ctaButton.setTitle(benefit?.ctaTitle, for: .normal)
            }
            .store(in: &subscriptions)
        
        viewModel.$benefitDetail
            .compactMap{ $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.addGuides(details: details)
            }
            .store(in: &subscriptions)
        
        // input: user interaction
    }
    
    private func addGuides(details: BenefitDetails) {
        // 이미 로드 된 element가 있을 때 중복 생성 방지용
        let guidesView = vStackView.arrangedSubviews.filter{ $0 is BenefitGuidView }
        guard guidesView.isEmpty else { return }
        
        let guideViews: [BenefitGuidView] = details.guides.map{ guide in
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
