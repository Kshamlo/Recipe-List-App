////
////  DataService.swift
////  Recipe List App
////
////  Created by Kora Shamloo on 8/30/21.
////
//
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DataService {
    private var db = Firestore.firestore()
    
    func getAllRecipes() -> [Recipe] {
        print("getAllRecipes called")
        let recipesCollection = db.collection("recipes")
        var recipes: [Recipe] = []
        
        print("getting all documents")
        recipesCollection.getDocuments { querySnapshot, error in
            if let error = error {
                print("ERROR")
                print(error)
            } else if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    print("document id", document.documentID)
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
            }
        }
        return recipes
    }
    
//    static func getLocalData() -> [Recipe] {
//
//        //Parse local json file
//
//        // Get a url path to the json file
//        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
//
//        guard pathString != nil else {
//            return [Recipe]()
//        }
//        // Create a url object
//        let url = URL(fileURLWithPath: pathString!)
//
//
//        do{
//            //Create a data object
//            let data = try Data(contentsOf: url)
//
//            //Decode the data with a JSON decoder
//            let decoder = JSONDecoder()
//
//            do{
//                let recipeData = try decoder.decode([Recipe].self, from: data)
//
//
//                // Add the unique IDs
//                for r in recipeData {
//                    r.id = UUID()
//
//                    // Add unique IDs to recipe ingredients
//                    for i in r.ingredients {
//                        i.id = UUID()
//                    }
//                }
//                // Return the recipes
//                return recipeData
//
//            }
//            catch{
//                // error with parsing json
//                print(error)
//            }
//
//
//
//        }
//        catch{
//            // error with getting data
//            print(error)
//        }
//        return [Recipe]()
//    }
//
    
    
    
    static func getRegionData() -> [Region] {
        
        //Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "regions", ofType: "json")
        
        guard pathString != nil else {
            print("No json found")
            return [Region]()
        }
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        
        do{
            //Create a data object
            let data = try Data(contentsOf: url)
            
            //Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do{
                let regionData = try decoder.decode([Region].self, from: data)
                // Add the unique IDs
                for r in regionData {
                    r.id = UUID()
                }
                // Return the recipes
                
                return regionData
                
                
            }
            
            
            catch{
                // error with parsing json
                print(error)
            }
            
            
        }
        catch{
            // error with getting data
            print(error)
        }
        return [Region]()
    }
    
}
