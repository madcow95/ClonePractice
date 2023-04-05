//
//  MoodDiaryStorage.swift
//  TextfieldTest
//
//  Created by ChoiKwangWoo on 2023/04/05
//

import Foundation

final class MoodDiaryStorage {
    
    func persist(_ items: [MoodDiary]) {
        Storage.store(items, to: .documents, as: "diary_list.json")
    }
    
    func fetch() -> [MoodDiary] {
        let list = Storage.retrive("diary_list.json", from: .documents, as: [MoodDiary].self) ?? []
        return list
    }
}
