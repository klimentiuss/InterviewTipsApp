//
//  DataController.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 20.10.2023.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    
    
    let containet = NSPersistentContainer(name: "InterviewTipsApp")
    
    init() {
        containet.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
            
        } catch {
            print("Error. Data could not save the data...")
        }
    }
    
    func addQuestion(questionText: String, answer: String, theme: String, context: NSManagedObjectContext) {
        let question = Question(context: context)
        question.questionID = UUID()
        question.questionText = questionText
        question.answerText = answer
        question.questionTheme = theme
        
        save(context: context)
        
    }
    
    func editQuestion(question: Question, questionText: String, answer: String, theme: String, context: NSManagedObjectContext) {
        question.questionText = questionText
        question.answerText = answer
        question.questionTheme = theme
        
        save(context: context)
    }
    
    
    func getQuestions(context: NSManagedObjectContext) {
        if !UserDefaults.standard.bool(forKey: "CoreDataInitialized") {
            guard let path = Bundle.main.url(forResource: "Question", withExtension: "json") else { return }
            guard let data = try? Data(contentsOf: path) else { return }
            if let questions = try? JSONDecoder().decode([QuestionModel].self, from: data) {
                for question in questions {
                    addQuestion(
                        questionText: question.question,
                        answer: question.answer,
                        theme: question.theme,
                        context: context)
                }
                print("Json saved to DB")
            }
            UserDefaults.standard.set(true, forKey: "CoreDataInitialized")
        }
    }
}
