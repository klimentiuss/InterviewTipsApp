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
    
    @StateObject private var viewModel = QuestionListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.search(by: filterText, in: questionList)) { question in
                        CardCell(question: question)
                    }
                }
            }
            .searchable(text: $filterText)
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
