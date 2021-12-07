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
        ScrollView {
            VStack(alignment: .leading) {
                /// MARK: Recipe Image
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .navigationBarHidden(true)
                } placeholder: {
                    ProgressView()
                }
                
                //Mark: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top)
                    .padding(.leading)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                
                Text(recipe.description)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 1)
                
                //MARK: Divider
                Divider()
                    .frame(height: 10)
                
                
                // Adding prep, cook, and total time
                
                HStack(alignment: .center){
                    Spacer()
                    
                    VStack{
                        Text("Prep Time" + ":" ).bold()
                        Text(recipe.prepTime)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Cook Time" + ":" ).bold()
                        Text(recipe.cookTime)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Total Time" + ":" ).bold()
                        Text(recipe.totalTime)
                    }
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.trailing)
                
                // MARK: Ingredients
                VStack (alignment: .leading){
                    
                    HStack {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        .padding(.horizontal, 5)
                        .foregroundColor(.red)
                        
                    Spacer()
                    
                        Text("Servings: " + String(recipe.servings))
                            .padding(.trailing, 5)
                            .opacity(0.5)

                    }
                    
                    ForEach (recipe.ingredients) { item in
                        Text(item.description)
                            .padding(.horizontal, 10)
                            .padding(.top, 10)
                    }
                    
                }
                .padding(.horizontal)
                
                //MARK: Divider
                Divider()
                    .frame(height: 10)
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        .padding(.horizontal, 5)
                        .foregroundColor(.red)
                    
                    ForEach(0..<recipe.directions.count) { index in
                        
                        Text(String(index+1) + "." + " " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .padding(.horizontal, 10)
                    }
                }
                .padding(.horizontal)
            }
            
            
            Text("This recipe is from" + " " + recipe.from)
                .padding(.top, 15)
                .opacity(0.4)
            
            
            
            
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        if model.recipes.count > 0  {
            RecipeDetailView(recipe: model.recipes[0])
        }
    }
}
