//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/05.
//

import Foundation
import Combine

final class DiaryListViewModel: ObservableObject {
    // To-do
    // Sequence -> Dictionary
    
    let storage: MoodDiaryStorage
    
    // 데이터 파일에서 일기 리스트 가져오기
    // 리스트에 해당 일기들 세팅
    // 세팅 후 Dictionary도 세팅
    
    @Published var list: [MoodDiary] = []
    @Published var dic: [String: [MoodDiary]] = [:]
    
    var subscriptions = Set<AnyCancellable>()
    
    init(storage: MoodDiaryStorage) {
        self.storage = storage
        bind()
    }
    
    var keys: [String] {
        return dic.keys.sorted{ $0 < $1 }
    }
    
    private func bind() {
        $list.sink { items in
            print("List Changed --> \(items)")
            self.dic = Dictionary(grouping: items, by: { $0.monthlyIdentifier })
            self.persist(items: items)
        }
        .store(in: &subscriptions)
    }
    
    func persist(items: [MoodDiary]) {
        guard items.isEmpty == false else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
}
