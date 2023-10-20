//
//  RandomQuestionView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 18.10.2023.
//

import SwiftUI

struct RandomQuestionView: View {
    
    @StateObject var viewModel = QuestionListViewModel()
    @State var question: QuestionModel?
    @State private var isDetailActive = false
     
    var body: some View {
        NavigationStack {
            List {
                if let question = question {
                   
                    Section(header: Text(question.theme), content: {
                        ForEach(1..<2, id: \.self) { _ in
                            CardCell(question: question.question, answer: question.answer)
                            NavigationLink("Edit question") {
                                EditQuestionView(element: question)
                            }
                            
                        }
                        
                    })
                }
            }
            .toolbar {
                Button {
                    question = viewModel.getRandomQuestion()
                } label: {
                    Text("Get question")
                }
            }
            .onAppear {
                viewModel.getQuestions()
                question = viewModel.getRandomQuestion()
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
