//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by ChoiKwangWoo on 2023/04/01.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
          Todo
          Tab이 눌릴 때마다 그에 맞는 Navigation Bar를 구성하고 싶다.
          - Tab이 눌리는 Event를 감지
          - 감지 후 그 탭의 title을 가져온다
          - Navigation Bar를 업데이트
         */
               
        delegate = self
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        switch viewController {
        case is HomeViewController:
            
            let titleItem = UIBarButtonItem(title: "정자동", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
            
        case is MyTownViewController:
            
            let titleItem = UIBarButtonItem(title: "정자동", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        case is ChatViewController:
            
            let titleItem = UIBarButtonItem(title: "채팅", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        case is MyProfileViewController:
            
            let titleItem = UIBarButtonItem(title: "나의 당근", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        default:
            
            let titleItem = UIBarButtonItem(title: "Default Carrot", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        }
        
    }
}
