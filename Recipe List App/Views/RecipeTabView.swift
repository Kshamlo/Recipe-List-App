//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/7/21.
//

import SwiftUI

enum Tab {
//    case Featured
    case Search
    case Explore
    case Account
}

struct TabInfo: Identifiable {
    var id = UUID()
    var view: Tab
    var icon: String
    var name: String
}


struct RecipeTabView: View {
    
    @Binding var loggedIn: Bool
    @State var tabs = [TabInfo]()
    @State var selectedTab = Tab.Search
    
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                
                // Swith the view according to the currently selected tab
                switch(selectedTab) {
//                case Tab.Featured:
//                    RecipeFeaturedView()
                case Tab.Search:
                    MultipleColumnView()
                case Tab.Explore:
                    RegionsView()
                case Tab.Account:
                    AccountView(loggedIn: $loggedIn)
                }
                
                
                Spacer()
                
                VStack {
                    
                    Path({ path in
                        path.move(to: CGPoint(x: 0, y: 0) )
                        path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                    })
                        .stroke(Color.gray)
                    
                    HStack (spacing: 0) {
                        
                        Spacer()
                        
                        ForEach(tabs) { tab in
                            
                            VStack (spacing: 5) {
                                Image(systemName: tab.icon)
                                Text(tab.name)
                                    .font(.caption)
                            }
                            .foregroundColor(tab.view == selectedTab ? Color.blue : Color.gray)
                            .padding(.vertical)
                            .frame(width: (geo.size.width - 24)/3, height: 60)
                            .onTapGesture{
                                // Set the selected tab
                                self.selectedTab = tab.view
                            }
                        }
                        Spacer()
                    }
                    
                }
                .frame(height: 70)
                
            }
            .environmentObject(RecipeModel())
            .environmentObject(RegionModel())
            
            .onAppear(perform: {
                
                var newTabs = [TabInfo]()
//                newTabs.append(TabInfo(view: Tab.Featured, icon: "star.fill", name: "Featured"))
                newTabs.append(TabInfo(view: Tab.Search, icon: "list.bullet", name: "Recipes"))
                newTabs.append(TabInfo(view: Tab.Explore, icon: "magnifyingglass", name: "Explore"))
                newTabs.append(TabInfo(view: Tab.Account, icon: "person", name: "Account"))
                self.tabs = newTabs
            })

        }
        
        
    }
    
    
    
//    struct RecipeTabView_Previews: PreviewProvider {
//        static var previews: some View {
//            @State var loggedIn = true
//            RecipeTabView(loggedIn: $loggedIn)
//        }
//    }
}
