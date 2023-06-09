//
//  MoodDiaryCell.swift
//  EmotionDiary
//
//  Created by ChoiKwangWoo on 2023/04/05.
//

import SwiftUI

struct MoodDiaryCell: View {
    
    var diary: MoodDiary
    
    var body: some View {
        Image(systemName: diary.mood.imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black.opacity(0.2), radius: 10)
    }
}

struct MoodDiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        MoodDiaryCell(diary: MoodDiary.list[0])
    }
}
