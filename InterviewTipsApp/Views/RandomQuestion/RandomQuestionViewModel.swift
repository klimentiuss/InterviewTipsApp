//
//  RandomQuestionViewModel.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 21.10.2023.
//

import CoreData
import SwiftUI


class RandomQuestionViewModel: ObservableObject {

    @Published var question: FetchedResults<Question>.Element?

    func getRandomQuestion(questionList: FetchedResults<Question>) {
        question = Array(questionList).randomElement()
    }
}
