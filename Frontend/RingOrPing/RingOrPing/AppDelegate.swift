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
            alarmTriggered()
            completionHandler([.alert, .sound])
        }
        
        if notification.request.identifier == failureId {
            failureTriggered();
            completionHandler([.alert, .sound])
        }
    }
}
