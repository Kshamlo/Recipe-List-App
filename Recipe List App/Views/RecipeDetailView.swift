//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 8/31/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    
    var body: some View {
        Text("Hello")
//        ScrollView {
//            VStack(alignment: .leading) {
//                /// MARK: Recipe Image
//                Image(recipe.image)
//                    .resizable()
//                    .scaledToFill()
//
//                //Mark: Recipe title
//                Text(recipe.name)
//                    .bold()
//                    .padding(.top, 20)
//                    .padding(.leading)
//                    .font(.largeTitle)
//                    .foregroundColor(.red)
//
//                // MARK: Ingredients
//                VStack (alignment: .leading){
//                    Text("Ingredients")
//                        .font(.headline)
//                        .padding([.bottom, .top], 5)
//                        .foregroundColor(.red)
//
//                    ForEach (recipe.ingredients) { item in
//                        Text(item.name)
//                    }
//
//                }
//                .padding(.horizontal)
//
//                //MARK: Divider
//                Divider()
//
//                //MARK: Directions
//                VStack(alignment: .leading) {
//                    Text("Directions")
//                        .font(.headline)
//                        .padding([.bottom, .top], 5)
//                        .foregroundColor(.red)
//
//                    ForEach(0..<recipe.directions.count) { index in
//
//                        Text(String(index+1) + "." + recipe.directions[index])
//                            .padding(.bottom, 5)
//                    }
//                }
//                .padding(.horizontal)
//            }
//
//        }

    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
