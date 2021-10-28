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
    var name:String { return _name ?? "" }
    var region:String?
    var featured:Bool { return _featured ?? false }
    var isFavorite: Bool { return _isFavorite ?? false }
    var image:String { return _image ?? "" }
    var description:String { return _description ?? "" }
    var prepTime:String { return _prepTime ?? "" }
    var cookTime:String { return _cookTime ?? "" }
    var totalTime:String { return _totalTime ?? "" }
    var servings:Int { return _servings ?? 1 }
    var highlights:[String] { return _highlights ?? [] }
    var ingredients:[Ingredient] { return _ingredients ?? [] }
    var directions:[String] { return _directions ?? [] }
    
    private var _name: String?
    private var _featured:Bool?
    private var _isFavorite: Bool?
    private var _image:String?
    private var _description:String?
    private var _prepTime:String?
    private var _cookTime:String?
    private var _totalTime:String?
    private var _servings:Int?
    private var _highlights:[String]?
    private var _ingredients:[Ingredient]?
    private var _directions:[String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case _name = "name"
        case region
        case _featured = "featured"
        case _isFavorite = "isFavorite"
        case _image = "image"
        case _description = "description"
        case _prepTime = "prepTime"
        case _cookTime = "cookTime"
        case _totalTime = "totalTime"
        case _servings = "servings"
        case _highlights = "highlights"
        case _ingredients = "ingredients"
        case _directions = "directions"
    }
}

class Ingredient: Codable, Identifiable, CustomStringConvertible {
    var id = UUID()
    var name:String { return _name ?? "" }
    var num:Int?
    var denom:Int?
    var unit:String?
    
    private var _name:String?
    
    public var description: String {
        var ret = ""
        if let num = self.num {
            if let denom = self.denom {
                ret += "\(num)/\(denom) "
            } else {
                ret += "\(num) "
            }
        }
        
        if let unit = self.unit {
            ret += "\(unit) "
        }
        
        ret += self.name
        
        return ret
    }
    
    enum CodingKeys: String, CodingKey {
        case _name = "name"
        case num
        case denom
        case unit
    }
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
