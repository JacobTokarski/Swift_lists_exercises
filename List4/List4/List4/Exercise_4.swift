//
//  Exercise_4.swift
//  List4
//
//  Created by Jakub Tokarski on 16/03/2025.
//

import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> PDFView { // tworzenie nowego widoku do wyświetlania pdf-u
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .vertical
        pdfView.usePageViewController(true)
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) { // wczytywanie dokumentu za każdym razem aktualizacji widoku
        uiView.document = PDFDocument(url: url)
    }
}

struct Exercise_4: View {
    var body: some View {
        if let url = Bundle.main.url(forResource: "sample", withExtension: "pdf") {
            PDFKitView(url: url)
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("Nie znaleziono pliku PDF.") // if , który reprezentuje stan w którym jego nazwa nie jest poprawna więc mamy "walidację wyświetlającą błąd"
                .foregroundColor(.red)
                .padding()
        }
    }
}


