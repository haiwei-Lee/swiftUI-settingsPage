//
//  ContentView.swift
//  swift_ui_demo
//
//  Created by didi on 2025/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            List (0..<11) {item in
                ListItemView().frame(height: 50)
            }.navigationTitle("个人中心").padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: -34, trailing: 0))
        
       
        
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
