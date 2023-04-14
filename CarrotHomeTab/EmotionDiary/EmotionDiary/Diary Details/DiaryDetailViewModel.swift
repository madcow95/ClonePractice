//
//  DiaryDetailViewModel.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/14.
//

import Foundation
import SwiftUI

final class DiarytDetailViewModel: ObservableObject {
    
    @Published var diaryList: Binding<[MoodDiary]>
    @Published var diary: MoodDiary
    
    init(diaryList: Binding<[MoodDiary]>, diary: MoodDiary) {
        self.diaryList = diaryList
        self.diary = diary
    }
    
    func delete() {
        diaryList.wrappedValue = diaryList.wrappedValue.filter{ $0.id != diary.id }
    }
    
}
