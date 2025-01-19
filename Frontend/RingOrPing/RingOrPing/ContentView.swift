//
//  ContentView.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//

import SwiftUI
import UIKit
import Foundation
import Combine

let bgColor: Color = Color("Dark")
let topBarColor: Color = Color("DarkChange")
let botBarColor: Color = Color("DarkChange")
let lineWidth: CGFloat = 2
var alarmP: Bool = true
var createP: Bool = false
var gListP: Bool = false

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
    @State private var onTimer: Bool = false
    @State private var timeChecker: Cancellable?
    
    @State private var alarmP: Bool = true
    @State private var createP: Bool = false
    @State private var joinP: Bool = false
    @State private var gListP: Bool = false
    
    let topBarView = TopBarView()
    let alarmPage = AlarmView()
    
    var body: some View {
        ZStack {
            if onTimer {
                CancelView()
            } else {
                VStack(spacing: 0) {
                    topBarView
                    if (alarmP)
                    {
                        alarmPage
                    }
                    else
                    {
                        GroupView(createP: $createP, joinP: $joinP, gListP: $gListP)
                    }
                    TransitionView(alarmP: $alarmP)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
                if (createP == true) {
                    CreateView(createP: $createP)
                }
                if(joinP == true) {
                    JoinView(joinP: $joinP)
                }
                if(gListP == true) {
                    GListView(gListP: $gListP)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(bgColor)
        .onDisappear {
            timeChecker?.cancel()
        }
        .onAppear {
            startTimer()
        }
    }
    
    func startTimer() {
        timeChecker = Timer.publish(every: 1, on: .main, in: .common)
                    .autoconnect()
                    .sink { _ in
                        checkForScheduledNotifications()
                    }
    }
    
    func checkForScheduledNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests {
                requests in
                var found = false
                for request in requests {
                    if request.identifier == failureId {
                        found = true
                    }
                }
                onTimer = found;
            }
        }
}

#Preview {
    ContentView()
}
