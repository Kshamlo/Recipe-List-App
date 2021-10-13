//
//  Recipe.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 8/30/21.
//

import Foundation
import FirebaseFirestoreSwift

class Recipe: Identifiable, Codable {
    @DocumentID var id:String?
    var name:String
    var region:String?
    var featured:Bool
    var isFavorite: Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
}

class Ingredient: Codable {
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}


//class Recipe: Identifiable, Decodable {
//
//    var id:UUID?
//    var name:String
//    var region:String?
//    var featured:Bool
//    var isFavorite: Bool
//    var image:String
//    var description:String
//    var prepTime:String
//    var cookTime:String
//    var totalTime:String
//    var servings:Int
//    var highlights:[String]
//    var ingredients:[Ingredient]
//    var directions:[String]
//
//}
//
//class Ingredient: Identifiable, Decodable {
//
//    var id:UUID?
//    var name:String
//    var num:Int?
//    var denom:Int?
//    var unit:String?
//
//}
