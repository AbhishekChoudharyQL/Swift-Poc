//
//  GifView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 11/05/23.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    
    //MARK: - Properties
    private let name: String
    
    //MARK: - intializer
    init(_ name: String) {
        self.name = name
    }
 
    //MARK: - functions to make UIRepresentable View
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = Bundle.main.url(forResource: name, withExtension: "gif"){
            let data = try! Data(contentsOf: url)
            webView.load(
                data,
                mimeType: "image/gif",
                characterEncodingName: "UTF-8",
                baseURL: url.deletingLastPathComponent()
            )
        }
        webView.scrollView.isScrollEnabled = false
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}

//MARK: - Previews
struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage("PVtR")
    }
}
