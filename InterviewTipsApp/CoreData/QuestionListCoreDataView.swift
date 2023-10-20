//
//  TestView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 20.10.2023.
//

import SwiftUI
import CoreData

struct QuestionListCoreDataView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest (sortDescriptors: [SortDescriptor(\.questionTheme, order: .reverse) ]) var question: FetchedResults<Question>
    
    @State private var showingAddView = false
    @State private var isIndicatorNotShowing = UserDefaults.standard.bool(forKey: "CoreDataInitialized")
    
    var body: some View {
        NavigationView {
            if isIndicatorNotShowing {
                VStack {
                    List {
                        ForEach(question) { question in
                            VStack {
                                
                                NavigationLink {
                                    AddQuestionView(isAddPressed: false, question: question)
                                } label: {
                                    CardCell(
                                        question: question.questionText ?? "",
                                        answer: question.answerText ?? "")
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Questions")
                .toolbar {
                    ToolbarItem {
                        Button {
                            showingAddView.toggle()
                        } label: {
                            Text("Add new")
                        }
                        
                    }
                }
                .sheet(isPresented: $showingAddView) {
                    AddQuestionView(isAddPressed: true)
                }
            } else {
                VStack {
                    ProgressView()
                    Text("Please wait, questions are loading...")
                    
                }
                .padding()
                .onAppear {
                    DispatchQueue.global(qos: .background).async {
                        DataController().getQuestions(context: managedObjContext)
                        
                        DispatchQueue.main.async {
                            isIndicatorNotShowing = true
                        }
                    }
                }
            }
        }
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
