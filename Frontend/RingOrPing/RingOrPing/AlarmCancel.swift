//
//  AlarmCancel.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-19.
//

import SwiftUI
import Combine

struct CancelView: View {
    @State private var timeLeft: TimeInterval = 0
    @State private var updateClock: Cancellable?
    
    var body: some View {
        Button(action: {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [failureId])
            print("Removed Failure!")
        }) {
            VStack {
                Text("\(Int(timeLeft)) seconds left!")
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 40)
                        .cornerRadius(20)
                        .foregroundStyle(.red)
                    Text("Cancel!").foregroundStyle(.white)
                }
            }
        }.onAppear {
            updateClock = Timer.publish(every: 1, on: .main, in: .common)
                        .autoconnect()
                        .sink { _ in
                            updateTime()
                        }
        }.onDisappear {
            updateClock?.cancel()
        }
    }
    
    func updateTime(){
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            for request in requests {
                if request.identifier == failureId {
                    if let trigger = request.trigger as? UNCalendarNotificationTrigger {
                        if let date = Calendar.current.date(from: trigger.dateComponents) {
                            timeLeft = date.timeIntervalSince(Date())
                        }
                    }
                }
            }
        }
    }
}
