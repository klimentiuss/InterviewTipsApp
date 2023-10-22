//
//  QLCDViewModel.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 21.10.2023.
//

import CoreData
import SwiftUI


class QuestionListViewModel: ObservableObject {
    
    @Published var grades = ["All", "Weak", "Regular", "Strong"]



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
    
    func sortByGrade(grade: String, list: FetchedResults<Question>) -> [FetchedResults<Question>.Element]  {
        switch grade {
        case "All":
            return Array(list)
        case "Weak":
            return Array(list).filter { $0.questionGrade == 0}
        case "Regular":
            return Array(list).filter { $0.questionGrade == 1}
        case "Strong":
            return Array(list).filter { $0.questionGrade == 2}
        default:
            return Array(list)
        }
    }

}
