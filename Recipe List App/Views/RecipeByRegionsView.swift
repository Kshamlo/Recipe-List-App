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
        
//        NavigationView {
            let regionRecipes = filteredRecipes.filter { $0.region == region.name }
               
            
            VStack (alignment:.leading) {
           
                Text(region.name)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.horizontal)
                    .padding(.top, 100)

                SearchBarView(filterBy: $filterBy)
                    .padding([.trailing, .bottom, .horizontal])
                
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16),
                    ], alignment: .leading, content:{
                        ForEach(regionRecipes) { recipe in
                            NavigationLink(
                                destination: RecipeDetailView(recipe:recipe),
                                label: {
                                    
                                    VStack(spacing: 20.0){
                                        AsyncImage(url: URL(string: recipe.image)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150, height: 150, alignment: .center)
                                                .clipped()
                                                .cornerRadius(5)
                                        } placeholder: {
                                            ProgressView()
                                                .frame(width: 150, height: 150, alignment: .center)
                                        }
                                        VStack (alignment: .leading) {
                                            Text(recipe.name)
                                                .font(.system(size:16, weight: .semibold))
                                                .accentColor(.black)
                                                .frame(width: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            RecipeHighlights(highlights: recipe.highlights)
                                                .font(.system(size:12, weight: .regular))
                                                .accentColor(.gray)
                                                .frame(width: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        }
                                    }
                                })
                        }
                    })
                    .padding(.horizontal)
                    .onTapGesture {
                        // Resign first responder
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }

            }

            } .edgesIgnoringSafeArea(.all)
    }
    
    struct RecipeByRegionView_Previews: PreviewProvider {
        static var previews: some View {
            let model = RegionModel()
            RecipeByRegionView(region: model.regions[0])
                .environmentObject(RecipeModel())
        }
    }
}
