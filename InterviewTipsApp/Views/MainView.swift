//
//  MainView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 18.10.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
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
            
            QuestionList()
                .tabItem {
                    Image(systemName: "square.topthird.inset.filled")
                    Text("List")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
