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
                    //GroupView()//my edit
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
    let topBarView = TopBarView()
    let transitionView = TransitionView()
    let alarmPage = AlarmView()
    let groupPage = GroupView()
    
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
                    groupPage
                }
                TransitionView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(bgColor)
        .onAppear {
            let currentHour = Calendar.current.component(.hour, from: Date())
            let currentMinute = Calendar.current.component(.minute, from: Date())
            scheduleAlarm(hour: currentHour, minute: currentMinute,  title: "Alarm", body: "Wek up")
            printAlarms()
        }
    }
}

#Preview {
    ContentView()
}
