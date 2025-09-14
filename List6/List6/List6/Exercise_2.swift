//
//  Exercise_2.swift
//  List6
//
//  Created by Jakub Tokarski on 11/05/2025.
//

import SwiftUI

struct Exercise_2: View {
    @State private var logoSize: CGFloat = 100
    @State private var navigateToHome = false

    var body: some View {
        if navigateToHome {
            HomeView()
        } else {
            VStack {
                Image("logo") //zdjęcie naszego loga appla
                    .resizable()
                    .scaledToFit()
                    .frame(width: logoSize, height: logoSize)
                    .onAppear {
                        withAnimation(.easeOut(duration: 4)) {
                            logoSize += 100 //wielkość loga po czasie 4 sekund , które upłyną w ramach animacji
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            navigateToHome = true //ekran navigacji który przeniesie nas do ekranu home po zakończeniu animacji
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Odwiedź stronę Apple.com") //tekst który pojawi się na ekranie HomeView po upływie naszej animacji
                .font(.largeTitle)
                .padding()
            
//            Image(systemName: "house.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .foregroundColor(.blue)
        }
    }
}

