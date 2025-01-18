//
//  ContentView.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//

import SwiftUI
import UIKit

let bgColor: Color = Color("Dark")

struct ContentView: View {
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
