//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by ChoiKwangWoo on 2023/04/01.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    let viewModel: HomeViewModel = HomeViewModel(network: NetworkService(configuration: .default))
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
    }
    
    private func bind() {
        viewModel.$items
            .receive(on: RunLoop.main)
            .sink { items in
                print("update collection view >>> \(items)")
            }
            .store(in: &subscriptions)
        
        viewModel.itemTapped
            .sink { item in
                // StoryBoard
                let sb = UIStoryboard(name: "Detail", bundle: nil)
        
                // ViewController
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            .store(in: &subscriptions)

    }
}
