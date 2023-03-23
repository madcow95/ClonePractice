//
//  BenefitListViewController.swift
//  TossBenefitTab
//
//  Created by ChoiKwangWoo on 2023/03/23.
//

import UIKit

class BenefitListViewController: UIViewController {
    
    /**
        사용자 관점 정리(User Story)
        - 포인트를 볼 수 있다.
        - 오늘의 혜택을 볼 수 있다.
        - 나머지 혜택 리스트를 볼 수 있다.
        - 포인트 셀을 눌렀을 때, 포인트 상세뷰로 이동한다.
        - 혜택관련 셀을 눌렀을 때, 혜택 상세뷰로 이동한다.
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "혜택"
    }
}
