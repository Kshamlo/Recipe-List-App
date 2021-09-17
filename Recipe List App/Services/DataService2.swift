//
//  Data Service2.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/9/21.
//

import Foundation

class DataService2 {
    
    static func getLocalData2() -> [Region] {
        
        //Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "regions", ofType: "json")
        
        guard pathString != nil else {
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

