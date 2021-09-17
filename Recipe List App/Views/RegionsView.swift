//
//  Regions Page.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/9/21.
//

import SwiftUI

struct RegionsView: View {
    
    @EnvironmentObject var model:RegionModel
    
    let recipeModel = RecipeModel()
    
    var body: some View {
        
        VStack {
            
            
       
            GeometryReader { geo in

                
                HStack {
                    Spacer()
                
                    NavigationView {
                        
                        VStack {
                            Text("Recipe By Regions")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.red
                                )
                                .padding(.leading, -80)
                            
                            ScrollView {
                            
                                    ForEach(model.regions) { r in

                                        NavigationLink(
                                            destination: RecipeByRegionView(region: r).environmentObject(recipeModel),
                                            label: {
                                                ZStack {
                                                
                                                    Image(r.image)
                                                        .colorMultiply(Color(red: 0.5, green: 0.5, blue: 0.5))
                                                    Text(r.name)
                                                        .font(.title)
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(Color.white)
                                                        
                                                }
                                                .frame(width: geo.size.width - 40, height: geo.size.height/3, alignment: .center)
                                                .cornerRadius(15)
                                            })


                                    }
                            }
                        }

                    }
                    Spacer()
                }
             
            }
            
        }


    }
    
    struct RegionsView_Previews: PreviewProvider {
        static var previews: some View {
            RegionsView()
                .environmentObject(RegionModel())
        }
    }
}
