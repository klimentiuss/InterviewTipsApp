//
//  MainViewModel.swift
//  InterviewTipsApp
//
//  Created by Daniil Klimenko on 21.10.2023.
//

import Foundation



class MainViewModel: ObservableObject {
    @Published var isIndicatorNotShowing = UserDefaults.standard.bool(forKey: "CoreDataInitialized")
}
