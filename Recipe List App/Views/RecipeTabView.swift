//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/7/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
     
        TabView {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            MultipleColumnView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
