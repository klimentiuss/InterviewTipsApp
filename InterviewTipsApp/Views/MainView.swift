//
//  MainView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 18.10.2023.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext

    @StateObject var viewModel = MainViewModel()
    @State private var isIndicatorNotShowing = UserDefaults.standard.bool(forKey: "CoreDataInitialized")
    
    var body: some View {
        if isIndicatorNotShowing {
            TabView {
                
                RandomQuestionView()
                    .tabItem {
                        Image(systemName: "questionmark.square")
                        Text("Random")
                    }
                ThemesView()
                    .tabItem {
                        Image(systemName: "books.vertical")
                        Text("Themes")
                    }
            
                QuestionListView()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("List")
                    }
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
