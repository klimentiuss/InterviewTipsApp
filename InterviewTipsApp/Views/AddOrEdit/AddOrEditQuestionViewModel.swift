//
//  TestVM.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 22.10.2023.
//

import SwiftUI
import CoreData

class AddOrEditQuestionViewModel: ObservableObject {
    
    //@FetchRequest (sortDescriptors: [SortDescriptor(\.questionTheme, order: .reverse)]) var questionList: FetchedResults<Question>
    
    @Published  var questionText = ""
    @Published  var questionAnswer = ""
    @Published  var newGrade = 0
    @Published  var newTheme = ""
    
    @Published var themeArray: [String] = []
    
    func sortForThemes(questionList: FetchedResults<Question>) {
        themeArray = Array(Set(questionList.map{$0.questionTheme ?? ""})).sorted(by: <)
    }
    
    func save(question: FetchedResults<Question>.Element?, context: NSManagedObjectContext) {
        if questionText.isEmpty || questionAnswer.isEmpty || newTheme.isEmpty {
            return
        }

        if let question = question {
            DataController().editQuestion(
                question: question,
                questionText: questionText,
                answer: questionAnswer,
                theme: question.questionTheme ?? "",
                grade: newGrade,
                context: context)
        } else {
            DataController().addQuestion(
                questionText: questionText,
                answer: questionAnswer,
                theme: newTheme,
                grade: newGrade,
                context: context)
        }
    }
    
    
    func prepareFields(question: FetchedResults<Question>.Element?) {
        if let question = question {
            questionText = question.questionText ?? ""
            questionAnswer = question.answerText ?? ""
            newTheme = question.questionTheme ?? ""
        }
    }
    
    func delete(question: FetchedResults<Question>.Element?, context: NSManagedObjectContext) {
        if let question = question {
            context.delete(question)

            do {
                try context.save()
            } catch {
                print("Delete error: \(error)")
            }
        }
    }
}


