//
//  LoginView.swift
//  Recipe List App
//
//  Created by Kora Shamloo on 9/16/21.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    var body: some View {
        ZStack{
            PlayerView()
                .colorMultiply(.gray)
            VStack {
                Spacer()
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    switch result {
                        case .success(let authResults):
                            print("Authorisation successful")
                        case .failure(let error):
                            print("Authorisation failed: \(error.localizedDescription)")
                    }
                }
                    .signInWithAppleButtonStyle(.black)
                    .frame(width: 280, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().ignoresSafeArea()
    }
}
