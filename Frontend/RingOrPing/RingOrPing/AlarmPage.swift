//
//  Untitled.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//

import SwiftUI
import UIKit

struct AlarmView: View {
    @State private var curHour = 0
    @State private var curMinute = 0
    @State private var curAMPM = 0
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
            }
            Spacer()
        }
    }
}
