//
//  EditQuestionView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 19.10.2023.
//

import SwiftUI

struct EditQuestionView: View {
    
    @StateObject var viewModel = QuestionListViewModel()
    @State var element: QuestionModel
        
    var body: some View {
        VStack {
            TextField("", text: $element.question, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(1...5)
            
            TextField("", text: $element.answer, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(1...5)
            
            Button {
                viewModel.updateQuestion(element.id, newQuestionText: element.question, newAnswerText: element.answer)
            } label: {
                Text("Save")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

struct EditQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        EditQuestionView(element: QuestionModel(id: "500", question: "dasdansjkdnasdkamskldmklamkdkl ka mdklasmdlkamsd lakdmalksm aklmdasdansjkdnasdkamskldmklamkdkl ka mdklasmdlkamsd lakdmalksm aklmdasdansjkdnasdkamskldmklamkdkl ka mdklasmdlkamsd lakdmalksm aklmd ", answer: "as ;lkdl;aks d;lak aldk l;ak d;alk; d;lka dkl ", theme: "123"))
    }
}
