//
//  ContentView.swift
//  List2
//
//  Created by Jakub Tokarski on 27/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    let phoneNumber = "+48 600 600 600"
    let address = "Fabryczna, Wrocław"
    let email = "xyz@google.pl"
    
    var body: some View {
        VStack(spacing: 20){
            Text("Contact")
                .font(.title)
                .padding(.bottom, 3.0)
            Spacer()
            Image(.picture1)
                .resizable()
                .scaledToFill()
                .overlay(Circle().stroke(style: StrokeStyle(lineWidth: 2)))
                .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.width/1.5)
                .clipShape(Circle())
            Spacer()
            VStack() {
                Text("Jan Kowalski")
                if let url = URL(string: "tel:\(phoneNumber)") { Link("tel: \(phoneNumber)", destination: url)
                }
                Text("www.apple.com")
                if let url = URL(string: "e-mail:\(email)") { Link("e-mail: \(email)", destination: url)
                }
                Text("ul. Fabryczna, Wrocław")
                Spacer()
                
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
