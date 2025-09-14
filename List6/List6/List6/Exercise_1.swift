//
//  Exercise_1.swift
//  List6
//
//  Created by Jakub Tokarski on 11/05/2025.
//

import SwiftUI

struct Exercise_1: View {
    let imgArr = ["image1", "image2", "image3", "image4", "image5"]
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(imgArr, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        }
        .edgesIgnoringSafeArea(.all)
    }
}
