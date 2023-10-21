//
//  QuestionsByThemeView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import SwiftUI
import CoreData


struct QuestionsByThemeView: View {
    
    @FetchRequest (sortDescriptors: [SortDescriptor(\.questionTheme, order: .reverse)]) var questionList: FetchedResults<Question>
    @StateObject private var viewModel = QuestionsByThemeViewModel()
    
    let theme: String
    
    var body: some View {
        List {
            ForEach(viewModel.sortByTheme(questionList: questionList, theme: theme), id: \.self) { question in
                CardCell(question: question)
            }
        }
    }
    
}

//struct QuestionsByThemeView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionsByThemeView(theme: "ООП")
//    }
//}
