//
//  AppDelegate.swift
//  Hatchback
//
//  Created by Alex Santarelli on 7/11/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import UIKit
import Parse


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, KiipDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let hb = HB() //contains keys for configuration and setup

        Parse.initialize(with: hb.getClientServerConfiguration())
        
        PFAnalytics.trackAppOpened(launchOptions: launchOptions)
        
        //Kiip Setup and Initialization
        let kiip:Kiip = hb.getKiipInstance()
        kiip.delegate = self
        Kiip.setSharedInstance(kiip)
        
        //Hatchback Setup
        hb.setDeviceSize(deviceHeight: (self.window?.rootViewController!.view.frame.height)!)
        
        //PFUser Setup //implement later
        //PFUser.enableRevocableSessionInBackground()
        
        //Appearance base attributes
        UITabBar.appearance().tintColor = UIColor(red: 230.0/255.0, green: 84.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        print("APPDELEGATE -- applicationWillResignActive \t\t- app is transtitioning into the background state")
        
        let defaults = DriveDefaults()

        if defaults.getDriveStatus() { //currently in drive
            //implementing the logic version of hatchback, penalization for leaving the app not through a button.
            if defaults.checkForAppLeftUnflagged() { //chceking to see if they left the app validated (correctly)
                print("APPDELEGATE -- applicationWillResignActive \t\t- app is being left flagged, the leave is okay.")
            } else {
                print("APPDELEGATE -- applicationWillResignActive \t\t- app is being left unflagged. We are starting the second timer.")
                defaults.setStartDriveDistractedDate()
            }
        }

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("APPDELEGATE -- applicationDidEnterBackground \t- app entering into the background queue.")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("APPDELEGATE -- applicationWillEnterForeground \t- app transitioning from background to Foreground state")
        
        //implementing the logic version of hatchback, penalization for leaving the app early

        let defaults =  DriveDefaults()

        if defaults.getDriveStatus() { //currently in drive
            if defaults.checkForAppLeftUnflagged() {
                print("APPDELEGATE -- applicationWillEnterForeground \t- app leave is validated.")
            } else {
                print("APPDELEGATE -- applicationWillEnterForeground \t- app leave is unvalidated, tracking the time.")
                defaults.setDriveEndDistractedDate()
                
                let startDate = defaults.getDistractedTimeStart()
                let endDate = defaults.getDistractedTimeEnd()
                
                let amtOfDistractedTime = endDate.timeIntervalSince(startDate)
                
                defaults.setTimeDistracted(time: amtOfDistractedTime)
                print("APPDELEGATE -- applicationWillEnterForeground \t- finished the distraction")
            }
            
        }
        
        defaults.resetAppLeftFlagged()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("APPDELEGATE -- applicationDidBecomeActive \t\t- app became active ")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("APPDELEGATE -- applicationWillTerminate \t\t- the app is about to be terminated from memory")
    }
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
//        if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps:")!) {
//        }
//        
//        return false
//    }

    // this will be used for opening spotify, apple music, google maps, and apple maps
    //    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    //
    //    }
}

