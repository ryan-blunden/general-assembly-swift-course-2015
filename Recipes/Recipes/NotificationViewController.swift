//
//  NotificationViewController.swift
//  Recipes
//
//  Created by Kate Lanyon on 11/06/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    /**
     * Users need to give permission for an app to send notifications.
     * Being strategic about when you ask for those permissions will help
     * you get more users allowing notifications for your app.
     * http://techcrunch.com/2014/04/04/the-right-way-to-ask-users-for-ios-permissions/
     */
    @IBAction func checkForNotificationPermissions(sender: AnyObject) {

        let application = UIApplication.sharedApplication() as UIApplication
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound|UIUserNotificationType.Alert | UIUserNotificationType.Badge, categories: nil))
    }

    /**
     * Send a notification right now. (Not that useful)
     */
    @IBAction func sendNotification(sender: AnyObject) {
        var localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Yar Pirate Ipsum"
        localNotification.alertBody = "Bilge chase scuppers case shot bilged on her anchor Sail ho spanker lugsail salmagundi fathom. List yardarm chandler driver gangplank bounty black jack spanker American Main yawl. "
        UIApplication.sharedApplication().presentLocalNotificationNow(localNotification)
    }
    
    /**
     * Schedule a notification for 1 minute from now.
     */
    @IBAction func scheduleNotification(sender: AnyObject) {
        var localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Make it so"
        localNotification.alertBody = "These walls have undergone some kind of selective molecular polarization. I haven't determined if our phaser energy can generate a stable field. We could alter the photons with phase discriminators."
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 60)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }

}
