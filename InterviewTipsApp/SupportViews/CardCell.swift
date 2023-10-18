//
//  CardCell.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 18.10.2023.
//

import SwiftUI

struct CardCell: View {
    
    var question: String
    var answer: String
    @State private var isHidden = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(question)
                .font(.system(size: 20))
                .bold()
                .padding(.horizontal, 20)
                
            if isHidden {
                Text(answer)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
            }
        }
        .onTapGesture {
            isHidden.toggle()
        }   
    }
}

struct CardCell_Previews: PreviewProvider {
    static var previews: some View {
        
        @StateObject var viewModel = QuestionListViewModel()
        CardCell(
            question: "Можно ли задать параметру функции значение по умолчанию?",
            answer: "Да, в Swift можно задать параметру функции значение по умолчанию, что делает его необязательным при вызове функции.")
    }
}
