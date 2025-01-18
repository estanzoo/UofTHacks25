//
//  AlarmNotif.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//
import UserNotifications

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            print("Permission granted")
        } else {
            print("Permission denied")
        }
    }
}

func scheduleAlarm(hour: Int, minute: Int, title: String, body: String) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarm.wav"))
    
    var dateComponents = DateComponents()
    dateComponents.hour = hour
    dateComponents.minute = minute + 1
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
        repeats: true
    )
    
    let request = UNNotificationRequest(identifier: "ring_or_ping_wakeup_alarm", content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling alarm: \(error)")
        } else {
            print("Alarm scheduled for hour=\(dateComponents.hour) and minute=\(dateComponents.minute)")
        }
    }
}

func printAlarms(){
    UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
       for request in requests {
           print("Scheduled Alarm: \(request.identifier), Trigger: \(String(describing: request.trigger))")
       }
   }
}
