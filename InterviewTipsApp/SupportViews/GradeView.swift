//
//  GradeView.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 22.10.2023.
//

import SwiftUI

struct GradeView: View {
    
    var  grade: Int64
    
    var body: some View {
        HStack {
            switch grade {
            case 0: Image(systemName: "circle")
            case 1: Image(systemName: "circle.lefthalf.filled")
            case 2: Image(systemName: "circle.fill")
            default: Image(systemName: "circle")
            }
        }
    }
}

struct GradeView_Previews: PreviewProvider {
    static var previews: some View {
        GradeView(grade: 0)
    }
}
