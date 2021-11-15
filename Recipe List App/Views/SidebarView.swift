////
////  SidebarView.swift
////  Recipe List App
////
////  Created by Kora Shamloo on 11/13/21.
////
//
//import SwiftUI
//
//struct MenuItem: Identifiable {
//    var id = UUID()
//    let text: String
//    
//    
//}
//
//struct MenuContent: View {
//    let items: [MenuItem] = [
//        MenuItem(text: "Home"),
//        MenuItem(text: "Home"),
//        MenuItem(text: "Home"),
//        MenuItem(text: "Home"),
//        MenuItem(text: "Home"),
//        
//    ]
//
//
//struct SideMenu: View {
//    let width: CGFloat
//    let menuOpened: Bool
//    let toggleMenu: () -> Void
//    
//    var body: some View {
//        ZStack {
//            // Dimmed background view
//            GeometryReader { _ in
//                EmptyView()
//            }
//            .background(Color.red.opacity(0.5))
//            .opacity(self.menuOpened ? 1 : 0)
//            .onTapGesture {
//                self.toggleMenu()
//            }
//            
//            
//            // MenuContent
//        }
//    }
//}
//
//struct SidebarView: View {
//    @State var menuOpened = false
//    
//    
//    var body: some View {
//        ZStack{
//            if !menuOpened {
//                Button(action: {
//                    // Open Menu
//                    self.menuOpened.toggle()
//                }, label: {
//                    Text("Open Menu")
//                        .frame(width: 200, height: 50, alignment: .center)
//                        .background(Color(.systemBlue))
//                })
//            }
//    
//            SideMenu(width: 370, menuOpened: menuOpened, toggleMenu: toggleMenu)
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//    
//    func toggleMenu() {
//        menuOpened.toggle()
//    }
//    
//}
//
//struct SidebarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SidebarView()
//    }
//}
//
//
