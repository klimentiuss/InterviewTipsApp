//
//  CardCell.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 18.10.2023.
//

import SwiftUI

struct CardCell: View {
    
    var question: FetchedResults<Question>.Element?
    @State private var isHidden = false
    
    var body: some View {
        
        if let question = question {
            VStack {
                NavigationLink {
                    AddOrEditQuestionView(isAddPressed: false, question: question)
                } label: {
                    VStack(alignment: .leading) {
                        Text(question.questionText ?? "")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.horizontal, 20)
                        
                        if isHidden {
                            VStack(alignment: .leading) {
                                HStack() {
                                    Text(question.questionTheme ?? "")
                                    GradeView(grade: question.questionGrade )
                                }
                                .opacity(0.5)
                                Text(question.answerText ?? "")
                                    .padding(.top, 10)
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                        }
                        
                    }
                    .onTapGesture {
                        isHidden.toggle()
                    }
                   
                    .onChange(of: question) { _ in
                        isHidden = false
                    }
                }
            }
        } 
        
        
        
    }
}

//struct CardCell_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
