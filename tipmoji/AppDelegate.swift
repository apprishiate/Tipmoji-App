//
//  AppDelegate.swift
//  tipmoji
//
//  Created by Rishi Talati on 12/29/17.
//  Copyright © 2017 Rishi Talati. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var lastTimeOpened: Date? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        lastTimeOpened = Date()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
      
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

        let timeSinceLastTimeOpened: Double = (lastTimeOpened?.timeIntervalSinceNow)!
        print("last time \(timeSinceLastTimeOpened)")
        
        // We compare if it's more than 15s then we will post a notification to reset UI
        if (abs(timeSinceLastTimeOpened) > Double(15))
        {
            
            let notification = Notification.init(name: Notification.Name(rawValue: "RefreshUIAfterTimeOut"), object: nil, userInfo: nil)
            NotificationCenter.default.post(notification)
            
            lastTimeOpened = Date()
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

