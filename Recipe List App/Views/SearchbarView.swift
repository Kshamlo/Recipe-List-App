//
//  SearchbarView.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/20/21.
//

import SwiftUI

struct SearchbarView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                HStack {
                    
                    HStack {
                        TextField("Search terms here", text: $searchText)
                            .padding(.leading, 24)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(5)
                    .padding(.horizontal)
                    .onTapGesture {
                        isSearching = true
                    }
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            
                            if isSearching {
                                Button(action: {searchText = ""}, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .padding(.vertical)
                                })
                                
                            }
                            
                        }.padding(.horizontal, 32)
                        .foregroundColor(.gray)
                    ).transition(.move(edge: .trailing))
                    .animation(.spring())
                    if isSearching {
                        
                        Button(action: {
                            isSearching = false
                            searchText = ""
                        }, label: {
                            Text("Cancel")
                                .padding(.trailing)
                                .padding(.leading, -12)
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                }
                
                ForEach((0..<20).filter({ "\($0)".contains(searchText) || searchText.isEmpty }), id: \.self) { num in
                    HStack {
                        Text("\(num)")
                        Spacer()
                        
                    }.padding()
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.leading)
                }
            }
            .navigationTitle("Food")
        }
        
        
        
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView()
    }
}
