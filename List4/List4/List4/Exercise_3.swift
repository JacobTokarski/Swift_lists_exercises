//
//  Exercise_3.swift
//  List4
//
//  Created by Jakub Tokarski on 16/03/2025.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL // adres który ma być zaimplementowany w przeglądarce

    func makeUIView(context: Context) -> WKWebView { // tworzenie widoku , który wywoływany jest raz podczas tworzenia
        let webView = WKWebView()
        let request = URLRequest(url: url) // adres URL który zostaje załadowany
        webView.load(request)
        return webView // zwracanie gotowego WKWebView , który pojawi się na symulatorze
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { // aktualizacja widoku jeśli np. zmieni się URL
    }
}

struct Exercise_3: View {
    var body: some View {
        WebView(url: URL(string: "https://www.apple.com")!)
            .edgesIgnoringSafeArea(.all)
    }
}
