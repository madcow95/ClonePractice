//
//  HomeViewModel.swift
//  CarrotHomeTab
//
//  Created by ChoiKwangWoo on 2023/04/03.
//

import Foundation
import Combine

final class HomeViewModel {
    // network를 통해 데이터 가져옴
    let network: NetworkService
    
    @Published var items: [ItemInfo] = []
    var subscriptions = Set<AnyCancellable>()
    
    let itemTapped = PassthroughSubject<ItemInfo, Never>()
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func fetch() {
        let resoucre: Resource<[ItemInfo]> = Resource(
            base: "https://my-json-server.typicode.com/",
            path: "cafielo/demo/products",
            params: [:],
            header: ["Content-Type": "application/json"])
        network.load(resoucre)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("error occured !! \(error)")
                case .finished:
                    print("network success")
                }
            } receiveValue: { items in
                self.items = items
            }
            .store(in: &subscriptions)

    }
}
