//
//  DiaryTextInputView.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/05
//

import SwiftUI

struct DiaryTextInputView: View {
    
    @ObservedObject var vm: DiaryViewModel
    @FocusState var focused: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: $vm.text)
                .focused($focused)
                .border(.gray.opacity(0.2), width: 2)
        }
        .padding()
        .onAppear {
            self.focused = true
        }
    }
}

struct DiaryTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryTextInputView(vm: DiaryViewModel(isPresented: .constant(false)))
    }
}
