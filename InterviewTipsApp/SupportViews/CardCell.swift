//
//  CardCell.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 18.10.2023.
//

import SwiftUI

struct CardCell: View {
    
    var question: FetchedResults<Question>.Element?
    @State private var isHidden = false
    
    var body: some View {
        
        VStack {
            NavigationLink {
                AddOrEditQuestionView(isAddPressed: false, question: question)
            } label: {
                VStack(alignment: .leading) {
                    Text(question?.questionText ?? "")
                        .font(.system(size: 20))
                        .bold()
                        .padding(.horizontal, 20)
                    
                    if isHidden {
                        Text(question?.questionTheme ?? "")
                        Text(question?.answerText ?? "")
                            .padding(.top, 20)
                            .padding(.horizontal, 20)
                    }
                }
                .onTapGesture {
                    isHidden.toggle()
                }
            }
        }
        
        
    }
}

//struct CardCell_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
