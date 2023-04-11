//
//  DiaryViewModel.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/11.
//

import Foundation
import SwiftUI
import Combine

// StateObject로 사용할 것이기 때문에 OjbervableObject 선언
final class DiaryViewModel: ObservableObject {
    
    @Published var diary: MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    @Published var date: Date = Date()
    @Published var mood: Mood = .great
    @Published var isPresented: Binding<Bool>
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
        
        $date.sink { date in
            print("selected date >> \(date)")
            self.update(date: date)
        }
        .store(in: &subscriptions)
        
        $mood.sink { mood in
            print("selected mood >> \(mood)")
            self.update(mood: mood)
        }
        .store(in: &subscriptions)
    }
    
    private func update(date: Date) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        self.diary.date = formatter.string(from: date)
    }
    
    private func update(mood: Mood) {
        self.diary.mood = mood
    }
    
}
