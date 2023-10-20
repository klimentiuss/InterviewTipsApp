//
//  ContentView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import SwiftUI

struct QuestionList: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = QuestionListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.searchResult(for: searchText), id: \.id) { element in
                    CardCell(question: element.question, answer: element.answer)
                    NavigationLink("Edit question") {
                        EditQuestionView(element: element)
                    }
                    
                }
            }
            .navigationTitle("Questions")
            .onAppear {
                viewModel.getQuestions()
            }
        }
        .searchable(text: $searchText)
    }
    
    
    
}

struct QuestionList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionList()
    }
}
