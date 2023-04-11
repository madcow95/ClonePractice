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
    
    @Published var date: Date = Date()
    @Published var isPresented: Binding<Bool>
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
        
        $date.sink { date in
            print("selected date >> \(date)")
        }
        .store(in: &subscriptions)
    }
}
