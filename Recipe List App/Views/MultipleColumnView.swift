import SwiftUI

struct MultipleColumnView: View {
    
    @EnvironmentObject var model:RecipeModel

    @State var showFavoritesOnly = true
    
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
            
            VStack(alignment:.leading) {
                
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.horizontal)
                
                SearchBarView(filterBy: $filterBy)
                    .padding([.trailing, .bottom])
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show Favorites Only")
                        .font(.body)
                }
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16),
                        
                    ], alignment: .leading, content: {
                        
                     
                            
                            
                            ForEach(filteredRecipes) { r in
                                
                                if !self.showFavoritesOnly || r.isFavorite {
                                    
                                    NavigationLink(
                                        destination: RecipeDetailView(recipe:r),
                                        label: {
                                            VStack(alignment: .leading, spacing: 4) {
                                                
                                                ZStack {
                                                    Image(r.image)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 150, height: 150, alignment: .center)
                                                        .clipped()
                                                        .cornerRadius(5)
                                                    if r.isFavorite {
                                                        Image(systemName: "star.fill")
                                                            .foregroundColor(.white)
                                                            .imageScale(.medium)
                                                    }
                                                }
                                                
                                                
                                                Text(r.name)
                                                    .font(.system(size:16, weight: .semibold))
                                                    .accentColor(.black)
                                                    .frame(width: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                RecipeHighlights(highlights: r.highlights)
                                                    .font(.system(size:12, weight: .regular))
                                                    .accentColor(.gray)
                                                    .frame(width: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                Spacer()
                                                
                                                
                                            }
                                        })
                                    
                                }
                            }
                            
                            
                    
                        
                    }).padding(.horizontal, 12)
                    .navigationBarHidden(true)
                    .onTapGesture {
                        // Resign first responder
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                    
                    
                }
                
            }
            
        }
        
    }
}

struct MultipleColumnView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleColumnView()
            .environmentObject(RecipeModel())
    }
}
