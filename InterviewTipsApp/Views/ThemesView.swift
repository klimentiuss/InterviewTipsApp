//
//  ThemesView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import SwiftUI

struct ThemesView: View {
    
    @StateObject var viewModel = QuestionListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sortForThemes().sorted(), id: \.self) { theme in
                    NavigationLink {
                        QuestionsByThemeView(theme: theme)
                            .navigationTitle(theme)
                    } label: {
                        Text(theme)
                    }
                }
            }
            .navigationTitle("Themes")
        }
        .onAppear {
            viewModel.getQuestions()
        }
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}
