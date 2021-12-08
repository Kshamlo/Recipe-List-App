//
//  Recipe_List_App.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 8/30/21.
//

import SwiftUI
import Firebase

@main
struct Recipe_List_App: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RecipeTabView()

        }
    }
}
