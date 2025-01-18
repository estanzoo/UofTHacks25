//
//  ContentView.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//

import SwiftUI
import UIKit

let bgColor: Color = Color("Dark")
let topBarColor: Color = Color("DarkChange")

struct TopBarView: View {
    @State var displayName: String = ""
    var body: some View {
        VStack() {
            Spacer().frame(height: 40)
            ZStack() {
                TextField("Display Name", text:$displayName, prompt: Text("Display Name").foregroundStyle(Color("ExtraDark")))
                    .padding()
                    .font(.system(size: 36, weight: .bold))
                    .padding(.horizontal)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .background(topBarColor)
        .frame(width: .infinity, height: 150)
    }
}

struct ContentView: View {
    let topBarView = TopBarView()
    
    var body: some View {
        ZStack {
            VStack() {
                topBarView
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(bgColor)
    }
}

#Preview {
    ContentView()
}
