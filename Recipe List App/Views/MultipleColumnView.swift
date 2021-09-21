import SwiftUI

struct MultipleColumnView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment:.leading) {
                
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16),
                      
                    ], alignment: .leading, content: {
                        
                        
                        ForEach(model.recipes) { r in
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    VStack(alignment: .leading, spacing: 4) {
                                        

                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150, height: 150, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                            

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
                        
                    }).padding(.horizontal, 12)
                    
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
