//
//  InterviewTipsAppApp.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 17.10.2023.
//

import SwiftUI

@main
struct InterviewTipsApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.containet.viewContext)
        }
    }
}
