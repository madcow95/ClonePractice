//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/05.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
    // To-do
    // Sequence -> Dictionary
    
    @Published var list: [MoodDiary] = MoodDiary.list
    @Published var dic: [String: [MoodDiary]] = [:]
    
    init() {
        self.dic = Dictionary(grouping: list, by: { $0.monthlyIdentifier })
    }
    
    var keys: [String] {
        return dic.keys.sorted{ $0 < $1 }
    }
}
