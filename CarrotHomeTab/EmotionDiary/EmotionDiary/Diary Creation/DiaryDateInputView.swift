//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/05
//

import SwiftUI

struct DiaryDateInputView: View {
    
    /**
        Todo
        - section date 가 저장될곳
     
        - isPresented 가 저장될곳
     
        - ViewModel 만들기
     
        - Navigation View
     
     */
  
    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        VStack {
            DatePicker(
                "Start Date",
                selection: $vm.date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
        }
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDateInputView(vm: DiaryViewModel(isPresented: .constant(false)))
    }
}
