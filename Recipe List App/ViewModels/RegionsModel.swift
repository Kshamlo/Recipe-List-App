//
//  RegionsModel.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/9/21.
//

import Foundation

class RegionsModel: ObservableObject {
    
    @Published var regions = [Region]()
    
    init() {
        self.regions = DataService.getLocalData()
    }
    
}
