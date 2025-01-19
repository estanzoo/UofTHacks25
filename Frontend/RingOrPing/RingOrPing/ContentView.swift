//
//  ContentView.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//

import SwiftUI
import UIKit
import Foundation


let bgColor: Color = Color("Dark")
let topBarColor: Color = Color("DarkChange")
let botBarColor: Color = Color("DarkChange")
let lineWidth: CGFloat = 2
var alarmP: Bool = true
var createP: Bool = false

struct TopBarView: View {
    @State var displayName: String = ""
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 40)
            ZStack() {
                TextField("Display Name", text:$displayName, prompt: Text("Display Name").foregroundStyle(Color("ExtraDark")))
                    .padding()
                    .font(.system(size: 36, weight: .bold))
                    .padding(.horizontal)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
            Rectangle().frame(height: lineWidth).foregroundStyle(.white)
        }
        .background(topBarColor)
        .frame(maxWidth: .infinity)
        .frame(height: 150)
    }
}

struct TransitionView: View {
    @Binding var alarmP: Bool
    var body: some View {
        VStack (spacing: 0) {
            Rectangle().frame(height: lineWidth).foregroundStyle(.white)
            HStack(spacing: 0) {
                Button(action: {
                    alarmP = true
                }) {
                    ZStack() {
                        Rectangle().foregroundStyle(botBarColor)
                        Text("Alarm").foregroundStyle(.white).font(.system(size: 36, weight: .bold))
                    }
                }
                
                Rectangle().frame(width: lineWidth).foregroundStyle(.white)

                Button(action: {
                    alarmP = false
                }) {
                    ZStack() {
                        Rectangle().foregroundStyle(botBarColor)
                        Text("Groups").foregroundStyle(.white).font(.system(size: 36, weight: .bold))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
    }
}

struct ContentView: View {
    @State private var alarmP: Bool = true
    @State private var createP: Bool = false
    @State private var joinP: Bool = false
    let topBarView = TopBarView()
    let alarmPage = AlarmView()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                topBarView
                if (alarmP)
                {
                    alarmPage
                }
                else
                {
                    GroupView(createP: $createP, joinP: $joinP)
                        
                }
                TransitionView(alarmP: $alarmP)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            if (createP == true)
            {
                CreateView(createP: $createP)
            }
            if(joinP == true)
            {
                JoinView(joinP: $joinP)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(bgColor)
    }
}

#Preview {
    ContentView()
}
