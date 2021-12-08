//
//  LaunchView.swift
//  Recipe List App
//
//  Created by Robert Thomas on 12/7/21.
//

import SwiftUI
import FirebaseAuthUI

struct LaunchView: View {
    
    @State var loggedIn = false
    @State var loginFormShowing = false
    
    var body: some View {
        //Check the logged in property and show the appropriate view
        if !loggedIn {
            Button {
                // Show the login form
                loginFormShowing = true
            } label: {
                Text("Sign In or Create Account")
            }
            .sheet(isPresented: $loginFormShowing, onDismiss: checkLogin) {
                LoginForm()
            }
            .onAppear {
                checkLogin()
            }
        }
        else {
            // Show logged in view
            RecipeTabView(loggedIn: $loggedIn)
        }
    }

    func checkLogin() {
        loggedIn = FUIAuth.defaultAuthUI()?.auth?.currentUser == nil ? false : true
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
