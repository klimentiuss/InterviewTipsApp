//
//  QuestionsByThemeViewModel.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 21.10.2023.
//

import CoreData
import SwiftUI


class QuestionsByThemeViewModel: ObservableObject {
    
    func sortByTheme(questionList: FetchedResults<Question>, theme: String) -> [FetchedResults<Question>.Element] {
        return Array(questionList.filter {$0.questionTheme == theme})
    }
}
