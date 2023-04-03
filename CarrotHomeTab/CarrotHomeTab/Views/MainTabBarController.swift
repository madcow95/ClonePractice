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
        
        // self.selectedIndex
        // self.selectedViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationItem(vc: self.selectedViewController!)
    }
    
    // 화면 시작할 때 NavigationBar update
    private func updateNavigationItem(vc: UIViewController) {
            
            switch vc {
            case is HomeViewController:
                
                let titleConfig = CustomBarItemConfiguration(title: "화곡동", handler: {})
                let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
                
                let searchConfig = CustomBarItemConfiguration(image: UIImage(systemName: "magnifyingglass"), handler: { print("search tapped") })
                let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)
                
                let feedConfig = CustomBarItemConfiguration(image: UIImage(systemName: "bell"), handler: { print("feed Item tapped") })
                let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)

                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItems = [feedItem, searchItem]
                // 뒤로가기 버튼이 Back이 아닌 아이콘만 나오게 표시
                navigationItem.backButtonDisplayMode = .minimal
                
            case is MyTownViewController:
                
                let titleConfig = CustomBarItemConfiguration(title: "화곡동", handler: {})
                let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
                
                let feedConfig = CustomBarItemConfiguration(image: UIImage(systemName: "bell"), handler: { print("feed Item tapped") })
                let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
                
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItems = [feedItem]
                navigationItem.backButtonDisplayMode = .minimal
            case is ChatViewController:
                
                let titleConfig = CustomBarItemConfiguration(title: "채팅", handler: {})
                let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
                
                let feedConfig = CustomBarItemConfiguration(image: UIImage(systemName: "bell"), handler: { print("feed Item tapped") })
                let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
                            
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItems = [feedItem]
                navigationItem.backButtonDisplayMode = .minimal
            case is MyProfileViewController:
                
                let titleConfig = CustomBarItemConfiguration(title: "나의 당근", handler: {})
                let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
                
                let feedConfig = CustomBarItemConfiguration(image: UIImage(systemName: "gearshape"), handler: { print("setting tapped") })
                let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
                
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItems = [feedItem]
                navigationItem.backButtonDisplayMode = .minimal
            default:
                
                let titleConfig = CustomBarItemConfiguration(title: "화곡동", handler: {})
                let titleItem = UIBarButtonItem.generate(with: titleConfig, width: nil)
                            
                navigationItem.leftBarButtonItem = titleItem
                navigationItem.rightBarButtonItems = []
                navigationItem.backButtonDisplayMode = .minimal
            }
    }
}
/**
    Todo
    - 각 탭에 맞게 Navigation Bar Item 구성
    - 홈 : Title, Feed, Search
    - 동네 활동 : Title, Feed
    - 내 근처 : Title
    - 채팅 : Title, Feed
    - 내 정보: Title, Setting
 */
extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateNavigationItem(vc: viewController)
    }
}
