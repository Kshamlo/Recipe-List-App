//
//  Region.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/9/21.
//

import Foundation

class Region: Identifiable, Decodable, ObservableObject {
    
    var id:UUID?
    var name:String
    var image:String
}
