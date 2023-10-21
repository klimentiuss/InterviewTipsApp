//
//  QLCDViewModel.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 21.10.2023.
//

import CoreData
import SwiftUI


class QuestionListViewModel: ObservableObject {
    


    func search(by filterText: String, in list: FetchedResults<Question>) -> [FetchedResults<Question>.Element] {
        if filterText.isEmpty {
            return Array(list)
        } else {
            return Array(list).filter {
                $0.questionText?.lowercased().contains(filterText.lowercased()) ?? false ||
                $0.answerText?.lowercased().contains(filterText.lowercased()) ?? false
            }
        }
    }

}
