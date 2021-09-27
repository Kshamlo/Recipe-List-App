//
//  UserData.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/27/21.
//

import Foundation
import SwiftUI
import Combine



class UserData : ObservableObject {
    
    var didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var recipes = Recipe.self {
        didSet {
            didChange.send(self)
        }
    }
    
}
