//
//  Regions.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/9/21.
//

import Foundation

class Region: Identifiable, Decodable {
    
    var id: UUID?
    var region:String
    var image:String
}
