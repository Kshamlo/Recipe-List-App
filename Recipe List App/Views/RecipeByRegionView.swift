//
//  RecipeByRegionView.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/15/21.
//

import SwiftUI

struct RecipeByRegionView: View {
    @EnvironmentObject var model:RecipeModel
    var region:Region
    
    
    var body: some View {
        let filteredRecipes = model.recipes.filter { $0.region == region.name }


            VStack {
                Text(region.name)
                List{
                    ForEach(filteredRecipes) { recipe in
                        NavigationLink(
                            destination: RecipeDetailView(recipe:recipe),
                            label: {
                                VStack(spacing: 20.0){
                                    Image(recipe.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack (alignment: .leading) {
                                    Text(recipe.name)
                                        .foregroundColor(.black)
                                        .bold()
                                        RecipeHighlights(highlights: recipe.highlights)
                                            .foregroundColor(.black)
                                    }
                                }
                        })
                    }
                }
            }
        
    }
}

struct RecipeByRegionView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RegionModel()
        RecipeByRegionView(region: model.regions[0])
            .environmentObject(RecipeModel())
    }
}
