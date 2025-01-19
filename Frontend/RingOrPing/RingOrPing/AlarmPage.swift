//
//  Untitled.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//

import SwiftUI
import UIKit
import UserNotifications

let alarm_id = "ring_or_ping_wakeup_alarm"

struct FmtAMPM {
    let hour: Int
    let minute: Int
    let AMPM: String
}
struct Fmt24 {
    let hour: Int
    let minute: Int
}

func from24(time: Fmt24) -> FmtAMPM {
    let newHour = time.hour % 12 == 0 ? 12 : time.hour % 12
    let newAMPM = time.hour >= 12 ? "PM" : "AM"
    return FmtAMPM(hour: newHour, minute: time.minute, AMPM: newAMPM)
}

func fromAMPM(time: FmtAMPM) -> Fmt24 {
    let newHour = (time.hour == 12 ? 0 : time.hour) + (time.AMPM == "PM" ? 12 : 0)
    return Fmt24(hour: newHour, minute: time.minute)
}

func updateVals(curHour: Int, curMinute: Int, curAMPM: String) {
    let formatted = fromAMPM(time: FmtAMPM(hour: curHour, minute: curMinute, AMPM: curAMPM))
    scheduleAlarm(hour: formatted.hour, minute: formatted.minute, title: "Alarm", body: "Wake up!")
}

struct AlarmView: View {
    @State private var curHour = 0
    @State private var curMinute = 0
    @State private var curAMPM = ""
    
    @State private var alHour = 0
    @State private var alMinute = 0
    @State private var alAMPM = ""
    
    let hours = Array(0...12)  // You can change the range for your use case
    let minutes = Array(0...59)
    let AMPM = ["AM", "PM"]
    
    var body: some View {
        VStack {
            Spacer()
            HStack (spacing: 0) {
                Picker("Hour:", selection: $curHour) {
                    ForEach(hours, id: \.self) { hour in
                        Text("\(hour)")
                            .tag(hour)
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .semibold))
                    }
                }
                .pickerStyle(WheelPickerStyle())  // Makes it look like the scrollable clock picker
                .frame(width: 64, height: 250)  // Adjust the size as needed
                .clipped()  // Clips content to ensure it doesn't overflow
                .padding()
                .onChange(of: curHour) {
                    updateVals(curHour: curHour, curMinute: curMinute, curAMPM: curAMPM)
                }
                
                Text(":").font(.system(size: 48)).foregroundStyle(.white)
                
                Picker("Hour:", selection: $curMinute) {
                    ForEach(minutes, id: \.self) { minute in
                        Text(String(format: "%02d", minute))
                            .tag(minute)
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .semibold))
                    }
                }
                .pickerStyle(WheelPickerStyle())  // Makes it look like the scrollable clock picker
                .frame(width: 64, height: 250)  // Adjust the size as needed
                .clipped()  // Clips content to ensure it doesn't overflow
                .padding()
                .onChange(of: curMinute) {
                    updateVals(curHour: curHour, curMinute: curMinute, curAMPM: curAMPM)
                }
                
                Picker("Hour:", selection: $curAMPM) {
                    ForEach(AMPM, id: \.self) { ampm in
                        Text("\(ampm)")
                            .tag(ampm)
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .semibold))
                    }
                }
                .pickerStyle(WheelPickerStyle())  // Makes it look like the scrollable clock picker
                .frame(width: 84, height: 250)  // Adjust the size as needed
                .clipped()  // Clips content to ensure it doesn't overflow
                .padding()
                .onChange(of: curAMPM) {
                    updateVals(curHour: curHour, curMinute: curMinute, curAMPM: curAMPM)
                }
            }
            Spacer()
        }.onAppear {
            UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
                for request in requests {
                    if request.identifier == alarm_id {
                        if let trigger = request.trigger as? UNCalendarNotificationTrigger {
                            print("updating")
                            let hour: Int = trigger.dateComponents.hour!
                            let minute: Int = trigger.dateComponents.minute!
                            print("Schedules \(request.identifier) with hour=\(hour) and minute=\(minute)")
                            
                            let toChange = from24(time: Fmt24(hour: hour, minute: minute))
                            curHour = toChange.hour
                            curMinute = toChange.minute
                            curAMPM = toChange.AMPM
                        }
                    }
                }
            }
        }
    }
}
