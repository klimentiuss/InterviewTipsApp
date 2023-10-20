//
//  Question.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import Foundation


struct QuestionModel: Codable, Identifiable {
    var id: String
    var question: String
    var answer: String
    var theme: String
}
