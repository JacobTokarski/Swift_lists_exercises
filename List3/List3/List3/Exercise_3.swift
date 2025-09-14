//
//  Exercise_3.swift
//  List3
//
//  Created by Jakub Tokarski on 15/03/2025.
//

import SwiftUI

struct Exercise_3: View {
    let phones = [
        "iPhone 12",
        "iPhone 12 Pro",
        "iPhone 12 Pro Max",
        "iPhone 12 Mini",
        "iPhone 13",
        "iPhone 13 Pro",
        "iPhone 13 Pro Max",
        "iPhone 13 Mini",
    ]
    @State var hoveredPhone: String? = nil
    
    var body: some View {
        
        List(phones, id:\.self) { phones in
            Text(phones)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(hoveredPhone == phones ? Color.gray.opacity(0.5) : Color.clear)
                .onTapGesture {
                    hoveredPhone = phones
                }
                .animation(.easeInOut(duration: 0.2), value: hoveredPhone)
        }
    }
}
    
#Preview {
    Exercise_3()
}
