//
//  ContentView.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/09.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .size(width: UIScreen.main.bounds.size.width * 2, height: 300)
                    .rotation(Angle.degrees(23))
                    .foregroundColor(.green)
                VStack() {
                    Text("Plug")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 50))
                        .shadow(color: .black, radius: 6, y: 5)
                    Text("Stay plugged in\nwith your family and frients")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .font(.system(size: 25))
                        .shadow(color: .black, radius: 6, y: 5)
                        .lineLimit(2)
                        .multilineTextAlignment(TextAlignment.center)

                }
            }.background(Color.teal)
                .frame(width: nil, height: UIScreen.main.bounds.size.height * 0.2)
            
            Form {
                TextField(
                    "User name (email address)",
                    text: $viewModel.username
                ).autocapitalization(.none)
                
                SecureField(
                    "Password",
                    text: $viewModel.password
                )
                
                PrimaryButton(
                    title: "Login",
                    action: {
                        viewModel.login()
                    }).padding()
            }.frame(width: nil, height: UIScreen.main.bounds.size.height * 0.45)
            
            VStack(alignment: HorizontalAlignment.center, spacing: 10) {
                Text("Are you new on this app")
                NavigationLink(destination: RegisterScreen()) {
                    Text("Create a new account")
                }
            }.frame(width: nil, height: UIScreen.main.bounds.size.height * 0.2)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
