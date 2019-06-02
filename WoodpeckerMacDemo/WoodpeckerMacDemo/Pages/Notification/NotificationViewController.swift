//
//  NotificationViewController.swift
//  WoodpeckerMacDemo
//
//  Created by xiaogang zhang on 2019/6/1.
//  Copyright © 2019 LIFE BETTER. All rights reserved.
//

import Cocoa
import UserNotifications

class NotificationViewController: NSViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.delegate = self
        let openAction = UNNotificationAction.init(identifier: UNNotificationDefaultActionIdentifier, title: "Okay", options: UNNotificationActionOptions.init(rawValue: 0))
        let category = UNNotificationCategory.init(identifier: "category_id", actions: [openAction], intentIdentifiers: [], options: UNNotificationCategoryOptions.init(rawValue: 0))
        let set = Set.init([category])
        notiCenter.setNotificationCategories(set)
    }
    
    @IBAction func scheduleButtonClicked(_ sender: Any) {
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.requestAuthorization(options: [UNAuthorizationOptions.alert,UNAuthorizationOptions.badge,UNAuthorizationOptions.sound]) { (okay, error) in
            if okay {
                self.schedule()
            }
            if let err = error {
                print(err)
                let alert = NSAlert.init()
                alert.messageText = "request authorization failed, you can try in your own project later"
                alert.addButton(withTitle: "Okay")
                alert.runModal();
            }
        }
    }
    
    func schedule () {
        let notiCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent.init()
        content.badge = 3
        content.body = "I'm body"
        content.title = "I'm title"
        content.subtitle = "I'm subtitle"
        content.userInfo = [
            "key" : "value"
        ]
        content.categoryIdentifier = "category_id";
        //60s
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 60, repeats: true)
        let identifier = String(arc4random())
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        notiCenter.add(request) { (error) in
            
        }
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    
    @IBAction func removeAllButtonClicked(_ sender: Any) {
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.removeAllPendingNotificationRequests();
    }
}
