//
//  VideoView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/21/22.
//

import SwiftUI
import WebKit

struct GifView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let urlString = urlString else {
            return
        }
        guard let url = URL(string: urlString) else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
}
