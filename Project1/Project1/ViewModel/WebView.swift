//
//  WebView.swift
//  Project1
//
//  Created by Dmitry on 27/2/24.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    //  https://oauth.vk.com/authorize?client_id=1&redirect_uri=http://example.com/callback&scope=12&display=mobile
    
    @Binding var token: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        
        urlComponent.queryItems = [
            URLQueryItem (name: "client_id", value: "51865354"),
            URLQueryItem (name: "redirect_uri", value: "http://oauth.vk.com/blank.html"),
            URLQueryItem (name: "display", value: "mobile"),
            URLQueryItem (name: "response_type", value: "token")]
        
        let req = URLRequest(url: urlComponent.url!)
        webView.load(req)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator { token in
            self.token = token
        }
    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    var token: (String) -> ()
    
    init(token: @escaping (String) -> Void) {
        self.token = token
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        // пример  https://oauth.vk.com/authorize?client_id=1&display=page&redirect_uri=http://example.com/callback&scope=friends&response_type=token&v=5.131&state=123456
        // проверка фрагмента на соответствие стандарту
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        // разбор фрагмента на параметры "словарь!"
        
        let params = fragment.components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce ([String:String]()) { res, param in
                var dict = res
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        if let accessToken = params["access_token"] {
            token(accessToken)
        }
        
        decisionHandler(.cancel)
    }
}
