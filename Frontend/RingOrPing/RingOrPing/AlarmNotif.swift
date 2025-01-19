//
//  AlarmNotif.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//
import UserNotifications

let triggerKey = "curTrigger"
let failureId = "ring_or_ping_failure"
let graceTime: TimeInterval = 30

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
    dateComponents.minute = minute
    dateComponents.second = 0
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
        repeats: true
    )
    
    let request = UNNotificationRequest(identifier: alarm_id, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling alarm: \(error)")
        } else {
            print("Alarm scheduled for hour=\(dateComponents.hour) and minute=\(dateComponents.minute)")
        }
    }
}

func scheduleFailure(date: Date) {
    let content = UNMutableNotificationContent()
    content.title = "Failure Sent"
    content.body = "Guess who's a lazy bum ;)"
    content.sound = UNNotificationSound.defaultRingtone
    
    let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
        repeats: false
    )
    
    let request = UNNotificationRequest(identifier: failureId, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling trigger: \(error)")
        } else {
            print("Trigger scheduled for \(date)")
        }
    }
}

func alarmTriggered() {
    let alTime = Date()
    let failTime = alTime.addingTimeInterval(graceTime)
    print("Alarm triggered.. scheduling failure for \(failTime)")
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm_id])
    scheduleFailure(date: failTime)
}

func failureTriggered() {
    print("Oh no! Failed!")
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [failureId])
}

func printAlarms(){
    UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
       for request in requests {
           print("Scheduled Alarm: \(request.identifier), Trigger: \(String(describing: request.trigger))")
       }
   }
}
