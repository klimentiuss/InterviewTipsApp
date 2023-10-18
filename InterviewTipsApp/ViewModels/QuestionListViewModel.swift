//
//  QuestionListViewModel.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import SwiftUI


class QuestionListViewModel: ObservableObject {
    
    @Published var questionList: [Question] = []
   
    
    func getQuestions() {
        guard let path = Bundle.main.url(forResource: "Question", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: path) else { return }
        if let questions = try? JSONDecoder().decode([Question].self, from: data) {
            self.questionList = questions
        }
    }
    
    func getRandomQuestion() -> Question? {
       questionList.randomElement() 
    }
    
    func searchResult(for text: String) -> [Question] {
        if text.isEmpty {
            return questionList
        } else {
            return questionList.filter { $0.answer.contains(text) || $0.question.contains(text) }
        }
    }
    
    func sortForThemes() -> Array<String> {
        return Array(Set(questionList.map{$0.theme}))
        
    }
    
    func sortByTheme(theme: String) -> [Question] {
        return questionList.filter {$0.theme == theme}
    }
}
