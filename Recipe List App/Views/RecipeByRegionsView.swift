//
//  RecipeByRegionsView.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/21/21.
//


import SwiftUI

struct RecipeByRegionView: View {
    @EnvironmentObject var model:RecipeModel
    var region:Region

    @State private var filterBy = ""
    
    
    private var filteredRecipes: [Recipe] {
        
        if filterBy.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            // No filter text, so return all recipes
            return Array(model.recipes)
        }
        else {
            // Filter by the search term and return
            // a subset of recipes which contain the search term in the name
            return model.recipes.filter { r in
                return r.name.contains(filterBy)
            }
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            let regionRecipes = filteredRecipes.filter { $0.region == region.name }
            
            VStack (alignment:.leading) {
                Text(region.name)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.horizontal)
                
                SearchBarView(filterBy: $filterBy)
                    .padding([.trailing, .bottom, .horizontal])
                
                ScrollView {
                    LazyVStack(alignment:.leading){
                        ForEach(regionRecipes) { recipe in
                            NavigationLink(
                                destination: RecipeDetailView(recipe:recipe),
                                label: {
                                    HStack(spacing: 20.0){
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
                    .padding(.horizontal)
                    .navigationBarHidden(true)
                    .onTapGesture {
                        // Resign first responder
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
}
