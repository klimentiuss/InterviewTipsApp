//
//  ActivityView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 21.10.2023.
//

import SwiftUI

struct ActivityView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            ProgressView()
            Text("Please wait, questions are loading...")
            
        }
        .padding()
        .onAppear {
            DispatchQueue.global(qos: .background).async {
                DataController().getQuestions(context: managedObjContext)
                
                DispatchQueue.main.async {
                    viewModel.isIndicatorNotShowing = true
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
