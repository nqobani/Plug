//
//  PrimaryButton.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/09.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "login", action: {
            
        })
    }
}
