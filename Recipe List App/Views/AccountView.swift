//
//  AccountView.swift
//  Recipe List App
//
//  Created by Robert Thomas on 12/7/21.
//

import SwiftUI
import FirebaseAuthUI

struct AccountView: View {
    
    @Binding var loggedIn: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                Text("Account")
            }
            Button {
                try! FUIAuth.defaultAuthUI()?.signOut()
                loggedIn = false
            } label: {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                    Text("Sign Out")
                }
            }
        }
    }
}

//struct AccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var loggedIn = true
//        AccountView(loggedIn: $loggedIn)
//    }
//}
