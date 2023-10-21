//
//  ThemesView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import SwiftUI
import CoreData

struct ThemesView: View {
    
    @FetchRequest (sortDescriptors: [SortDescriptor(\.questionTheme, order: .reverse)]) var questionList: FetchedResults<Question>
    @StateObject private var viewModel = ThemesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sortForThemes(questionList: questionList), id: \.self) { theme in
                    NavigationLink {
                        QuestionsByThemeView(theme: theme ?? "")
                            .navigationTitle(theme ?? "")
                    } label: {
                        Text(theme ?? "")
                    }
                }
            }
            .navigationTitle("Themes")
        }
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}
