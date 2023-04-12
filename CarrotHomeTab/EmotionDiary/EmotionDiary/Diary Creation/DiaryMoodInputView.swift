//
//  DiaryMoodInputView.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/05
//

import SwiftUI

struct DiaryMoodInputView: View {
    
    /**
        Todo
        - 선택할 감정들 표현
        - 감정 선택시 ViewModel에 저장
        - ViewModel 앞에 뷰에서 받아오기
     */
    
    @ObservedObject var vm: DiaryViewModel
    
    let moods: [Mood] = Mood.allCases
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                ForEach(moods, id: \.self) { mood in
                    Button {
                        print("Mood Selected >> \(mood)")
                        vm.mood = mood
                    } label: {
                        VStack {
                            Image(systemName: mood.imageName)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80)
                                .shadow(color: .black.opacity(0.2), radius: 10)
                                .padding()
                            
                            Text(mood.name)
                                .foregroundColor(Color.gray)
                        }
                        .frame(height: 180)
                        .background(mood == vm.mood ? Color.gray.opacity(0.4) : Color.clear)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            NavigationLink {
                DiaryTextInputView(vm: vm)
            } label: {
                Text("Next")
                    .frame(width: 200, height: 80)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(40)
            }
        }
    }
}

struct DiaryMoodInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryMoodInputView(vm: DiaryViewModel(isPresented: .constant(false)))
    }
}
