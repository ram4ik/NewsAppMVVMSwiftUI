//
//  NewsArticleWebView.swift
//  NewsAppMVVMSwiftUI
//
//  Created by ramil on 30.09.2020.
//

import SwiftUI

struct NewsArticleWebView: View {
    
    var newsUrl: String
    
    var body: some View {
        WebView(urlString: newsUrl)
            .padding(.top, 20)
    }
}
