//
//  RegisterScreen.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/09.
//

import SwiftUI

struct RegisterScreen: View {
    @StateObject private var viewModel = RegisterViewModel()
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
                    "User name",
                    text: $viewModel.username
                ).autocapitalization(.none)
                
                TextField(
                    "Email address",
                    text: $viewModel.email
                ).autocapitalization(.none)
                
                SecureField(
                    "Password",
                    text: $viewModel.password
                )
                SecureField(
                    "Confirm Password",
                    text: $viewModel.confirmPassword
                )
                
                Toggle(isOn: $viewModel.isOldEnough) {
                    Text("Are you 18 years old of older?")
                }
                PrimaryButton(
                    title: "Login",
                    action: {
                        viewModel.registerNewUser()
                    }).padding()
            }.frame(width: nil, height: UIScreen.main.bounds.size.height * 0.45, alignment: .center)
            
            VStack(alignment: HorizontalAlignment.center, spacing: 10) {
                Text("Already have an account?")
                Button("Login", action: {
                    
                })
            
            }.frame(width: nil, height: UIScreen.main.bounds.size.height * 0.2)
            
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
