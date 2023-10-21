//
//  ThemesViewModel.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 21.10.2023.
//

import CoreData
import SwiftUI


class ThemesViewModel: ObservableObject {

    func sortForThemes(questionList: FetchedResults<Question>) -> Array<String?> {
        return Array(Set(questionList.map{$0.questionTheme}))
    }
}
