//
//  QuestionsByThemeView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import SwiftUI

struct QuestionsByThemeView: View {
    
    let theme: String
    @StateObject var viewModel = QuestionListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.sortByTheme(theme: theme), id: \.id) { element in
                CardCell(
                    question: element.question,
                    answer: element.answer)
            }
        }
        .onAppear {
            viewModel.getQuestions()
            
        }
    }
}

struct QuestionsByThemeView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsByThemeView(theme: "ООП")
    }
}
