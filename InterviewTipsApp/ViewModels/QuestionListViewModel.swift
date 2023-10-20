//
//  QuestionListViewModel.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import SwiftUI


class QuestionListViewModel: ObservableObject {
    
    @Published var questionList: [QuestionModel] = []
   
    
    func getQuestions() {
        guard let path = Bundle.main.url(forResource: "Question", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: path) else { return }
        if let questions = try? JSONDecoder().decode([QuestionModel].self, from: data) {
            self.questionList = questions
        }
    }
    
    func getRandomQuestion() -> QuestionModel? {
       questionList.randomElement() 
    }
    
    func searchResult(for text: String) -> [QuestionModel] {
        if text.isEmpty {
            return questionList
        } else {
            return questionList.filter { $0.answer.contains(text) || $0.question.contains(text) }
        }
    }
    
    func sortForThemes() -> Array<String> {
        return Array(Set(questionList.map{$0.theme}))
        
    }
    
    func sortByTheme(theme: String) -> [QuestionModel] {
        return questionList.filter {$0.theme == theme}
    }
    
    func saveData() {
     
        
            if let encodedData = try? JSONEncoder().encode(questionList) {
                guard let path = Bundle.main.url(forResource: "Question", withExtension: "json") else { return }
                do {
                    try encodedData.write(to: path)
                    print("Данные успешно сохранены.")
                } catch {
                    print("Ошибка сохранения данных: \(error)")
                }
            }
        }
    
    
    func updateQuestion(_ questionID: String, newQuestionText: String, newAnswerText: String) {
            // Найдите элемент в массиве по идентификатору
            if let index = questionList.firstIndex(where: { $0.id == questionID }) {
                // Обновите значения вопроса и ответа
                questionList[index].question = newQuestionText
                questionList[index].answer = newAnswerText

                // Сохраните обновленные данные
                saveData()
            }
        }
}
