//
//  RegionModel.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/9/21.
//

import Foundation

class RegionModel: ObservableObject {
    
    @Published var regions = [Region]()
    
    init() {
        // Create an instance of data service and get the data

        self.regions = DataService.getRegionData()
        
    }
}
