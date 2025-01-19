//
//  AppDelegate.swift
//  RingOrPing
//
//  Created by Daniel Ye on 2025-01-18.
//

import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Request notification permission
        requestNotificationPermission()
        
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        if notification.request.identifier == alarm_id{
            var toRun: Bool = false
            print("Alarm triggered...")
            
            let last = UserDefaults.standard.value(forKey: lastAlarmKey)
            if let time = last as? Date {
                print("... with time difference \(Date().timeIntervalSince(time))")
                if Date().timeIntervalSince(time) > 10 {
                    toRun = true
                    UserDefaults.standard.set(Date(), forKey: lastAlarmKey)
                }
            } else {
                toRun = true
                UserDefaults.standard.set(Date(), forKey: lastAlarmKey)
            }
            
            if toRun {
                alarmTriggered()
                completionHandler([.alert, .sound])
            }
        }
        
        if notification.request.identifier == failureId {
            failureTriggered();
            completionHandler([.alert, .sound])
        }
    }
}
