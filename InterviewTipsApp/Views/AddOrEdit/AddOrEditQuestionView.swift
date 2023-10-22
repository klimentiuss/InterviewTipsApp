//
//  AddQuestionView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 20.10.2023.
//

import SwiftUI


struct AddOrEditQuestionView: View {

    var isAddPressed: Bool
    var question: FetchedResults<Question>.Element?

    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss

    @StateObject private var viewModel = AddOrEditQuestionViewModel()
    
    @FetchRequest (sortDescriptors: [SortDescriptor(\.questionTheme, order: .reverse)]) var questionList: FetchedResults<Question>

    var body: some View {
        NavigationView {
                Form {
                    VStack {
                        TextField("Question", text: $viewModel.questionText, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .lineLimit(1...5)

                        TextField("Answer", text: $viewModel.questionAnswer, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .lineLimit(1...5)

                        VStack(alignment: .leading) {
                            TextField("Theme", text: $viewModel.newTheme, axis: .vertical)
                                .textFieldStyle(.roundedBorder)
                            HStack {
                                Picker("", selection: $viewModel.newTheme) {
                                    ForEach(viewModel.themeArray, id: \.self) { theme in
                                        Text(theme).tag(theme)
                                    }
                                }
                                Spacer()
                            }

                        }

                        Picker("", selection: $viewModel.newGrade) {
                            Text("weak").tag(0)
                            Text("regular").tag(1)
                            Text("strong").tag(2)
                        }
                        .pickerStyle(.segmented)


                    }
                    .textFieldStyle(.roundedBorder)
                    HStack {
                        Spacer()
                        Button {
                            viewModel.save(question: question, context: managedObjContext)
                            dismiss()
                        } label: {
                            Text("Save")
                        }

                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Button {
                            viewModel.delete(question: question, context: managedObjContext)
                            dismiss()
                        } label: {
                            Text("DELETE")
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }
                }

            
            .navigationTitle(isAddPressed ? "Add new question" : "Edit question")
            .onAppear {
                viewModel.prepareFields(question: question)
                viewModel.sortForThemes(questionList: questionList)
            }
        }

    }
}

struct AddQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrEditQuestionView(isAddPressed: true)
    }
}



