//
//  AddQuestionView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 20.10.2023.
//

import SwiftUI


struct AddOrEditQuestionView: View {
    
    var isAddPressed: Bool
    
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    
    var question: FetchedResults<Question>.Element?
    @State private var questionText = ""
    @State private var questionAnswer = ""
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    TextField("", text: $questionText, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(1...5)
                    
                    TextField("", text: $questionAnswer, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(1...5)
                }
                .textFieldStyle(.roundedBorder)
                HStack {
                    Spacer()
                    Button {
                        if let question = question {
                            DataController().editQuestion(
                                question: question,
                                questionText: questionText,
                                answer: questionAnswer,
                                theme: question.questionTheme ?? "",
                                context: managedObjContext)
                        } else {
                            DataController().addQuestion(
                                questionText: questionText,
                                answer: questionAnswer,
                                theme: "",
                                context: managedObjContext)
                        }
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    Spacer()
                }
                
            }
            .navigationTitle(isAddPressed ? "Add new question" : "Edit question")
            .onAppear {
                if let question = question {
                    questionText = question.questionText ?? ""
                    questionAnswer = question.answerText ?? ""
                }
            }
        }
        
    }
}

struct AddQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrEditQuestionView(isAddPressed: true)
    }
}
