//
//  TestView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 20.10.2023.
//

import SwiftUI
import CoreData


struct QuestionListView: View {
    
    @FetchRequest (sortDescriptors: [SortDescriptor(\.questionTheme, order: .reverse)]) var questionList: FetchedResults<Question>
    
    @State private var showingAddView = false
    @State private var filterText: String = ""
    @State private var selectedGrade = "All"
    
    @StateObject private var viewModel = QuestionListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(
                        selectedGrade == "All"
                        ? viewModel.search(by: filterText, in: questionList)
                        : viewModel.sortByGrade(grade: selectedGrade, list: questionList))
                    { question in
                        CardCell(question: question)
                    }

                }
            }
            .searchable(text: $filterText)
            .navigationTitle("Questions")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Text("Add new")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker("Select", selection: $selectedGrade) {
                        ForEach(viewModel.grades, id: \.self) { grade in
                            Text(grade).tag(grade)
                        }
                    }
                    
                    
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddOrEditQuestionView(isAddPressed: true)
            }
        }
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
