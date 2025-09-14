//
//  Exercise_2.swift
//  List4
//
//  Created by Jakub Tokarski on 16/03/2025.
//

import SwiftUI

struct Exercise_2: View {
    var body: some View {
        TabView { // kontener zakładek
            
            Text("Top Rated")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Top Rated")
                }

            Text("Bookmarks")
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Bookmarks")
                }

            Text("Contacts")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Contacts")
                }
        }
    }
}

