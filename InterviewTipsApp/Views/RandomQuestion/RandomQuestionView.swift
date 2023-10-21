//
//  RandomQuestionView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 18.10.2023.
//

import SwiftUI
import CoreData

struct RandomQuestionView: View {
    
    @FetchRequest (sortDescriptors: [SortDescriptor(\.questionTheme, order: .reverse)]) var questionList: FetchedResults<Question>
    @StateObject private var viewModel = RandomQuestionViewModel()
    
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text(viewModel.question?.questionTheme ?? ""), content: {
                    ForEach(1..<2, id: \.self) { _ in
                        CardCell(question: viewModel.question)
                    }
                })
            }
            .toolbar {
                Button {
                    viewModel.getRandomQuestion(questionList: questionList)
                } label: {
                    Text("Get question")
                }
            }
            .onAppear {
                viewModel.getRandomQuestion(questionList: questionList)
            }
            .navigationTitle("Random Question")
        }
    }
}

struct RandomQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        RandomQuestionView()
    }
}
