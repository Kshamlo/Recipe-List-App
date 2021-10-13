//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 8/30/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    @Published var filteredRecipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        
        let dataService = DataService()

        self.recipes = dataService.getAllRecipes()
        self.filteredRecipes = recipes
                
    }
    
}
