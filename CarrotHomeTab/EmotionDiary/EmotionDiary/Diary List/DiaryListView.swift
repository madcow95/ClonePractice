//
//  ContentView.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/05
//

import SwiftUI

struct DiaryListView: View {
    
//    @State var list: [MoodDiary] = MoodDiary.list
    @StateObject var vm: DiaryListViewModel
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: layout) {
            ForEach(vm.keys, id:\.self) { key in
                Section {
                    let items = vm.dic[key] ?? []
                    let orderedItems = items.sorted{ $0.date < $1.date }
                    
                    ForEach(orderedItems) { item in
                        MoodDiaryCell(diary: item)
                            .frame(height: 50)
                    }
                } header: {
                    Text(key)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel())
    }
}
