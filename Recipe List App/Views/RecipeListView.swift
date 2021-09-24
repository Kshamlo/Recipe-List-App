//
//  ContentView.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 8/30/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
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
            
            VStack (alignment: .leading) {
                
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                
                SearchBarView(filterBy: $filterBy)
                    .padding([.trailing, .bottom])
                
                
                ScrollView{
                    LazyVStack(alignment:.leading) {
                        ForEach(filteredRecipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    
                                    //MARK: Row Item
                                    HStack(spacing: 20.0){
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        VStack (alignment: .leading) {
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .bold()
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                        }
                                    }
                                })
                            
                        }
                    }
                }
                
                
            }
            .navigationBarHidden(true)
            .padding(.leading)
            .onTapGesture {
                // Resign first responder
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }

    }
}

struct  RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}

}
