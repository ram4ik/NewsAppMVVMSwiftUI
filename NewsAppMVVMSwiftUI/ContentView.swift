//
//  ContentView.swift
//  NewsAppMVVMSwiftUI
//
//  Created by ramil on 29.09.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var newsListVM = NewsListVM()
    
    init() {
        newsListVM.load()
    }
    
    @State private var show = false
    @AppStorage("APIKEY") var apiKey = ""
    
    var body: some View {
        NavigationView {
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
                .navigationTitle(Text("Top Headlines"))
                .navigationBarItems(trailing: Button(action: {
                    show.toggle()
                }, label: {
                    Image(systemName: "gear")
                }))
                .sheet(isPresented: $show) {
                    VStack {
                        Text("Set your API key")
                            .padding()
                        
                        TextField("APIKEY", text: $apiKey)
                            .padding()
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
