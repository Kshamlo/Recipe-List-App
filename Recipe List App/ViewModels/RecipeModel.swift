//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 8/30/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    @Published var filteredRecipes = [Recipe]()
    private var db = Firestore.firestore()
    
    init() {
        
        getAllRecipes()
        self.filteredRecipes = recipes

    }
    
    func getAllRecipes() {
        print("getAllRecipes called")
        let recipesCollection = db.collection("recipes")
        
        print("getting all documents")
        print("recipesCollection", recipesCollection)
        recipesCollection.getDocuments() { querySnapshot, error in
            print("Made it here...")
            if let error = error {
                print("ERROR")
                print(error)
            } else if let querySnapshot = querySnapshot {
                var recipes: [Recipe] = []
                for document in querySnapshot.documents {
                    print("document id", document.documentID)
//                    print("document", document.data())
                    let result = Result { try document.data(as: Recipe.self) }
                    switch result {
                    case .success(let recipe):
                        if let recipe = recipe {
                            recipes.append(recipe)
                        }
                        else {
                            print("Document does not exist")
                        }
                    case .failure(let error):
                        // A Book value could not be initialized from the DocumentSnapshot.
                        switch error {
                        case DecodingError.typeMismatch(_, let context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case DecodingError.valueNotFound(_, let context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case DecodingError.keyNotFound(_, let context):
                            print("\(error.localizedDescription): \(context.debugDescription)")
                        case DecodingError.dataCorrupted(let key):
                            print("\(error.localizedDescription): \(key)")
                        default:
                            print("Error decoding document: \(error.localizedDescription)")
                              
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.recipes = recipes
                    print("self.recipes", self.recipes)
                }
            }
        }
    }
}
