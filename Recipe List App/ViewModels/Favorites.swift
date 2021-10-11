//
//  Favorites.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/27/21.
//

import SwiftUI

class Favorites: ObservableObject {

    private var recipes: Set<UUID>
    let defaults = UserDefaults.standard
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let recipeData = try? decoder.decode(Set<UUID>.self, from: data)
            self.recipes = recipeData ?? []
        }
        else {
            self.recipes = []
        }
    }
    
    func getRecipeIds() -> Set<UUID> {
        return self.recipes
    }
    
    func isEmpty() -> Bool {
        recipes.count < 1
    }
    
    func contains(_ recipe: Recipe) ->  Bool {
        if(recipe.id != nil) {
            return recipes.contains(recipe.id!)
        }
        return false
    }
    
    func add(_ recipe: Recipe) {
        objectWillChange.send()
        recipes.insert(recipe.id!)
        save()
    }
    
    func remove(_ recipe: Recipe) {
        objectWillChange.send()
        recipes.remove(recipe.id!)
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(recipes) {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
    
}
