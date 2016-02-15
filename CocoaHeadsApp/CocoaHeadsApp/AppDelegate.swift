//
//  AppDelegate.swift
//  CocoaHeadsApp
//
//  Created by Antoine Barrault on 30/10/2015.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import XCGLogger

let logger = XCGLogger.defaultInstance()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        logger.setup(.Debug, showLogIdentifier: false, showFunctionName: true, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, showDate: false, writeToFile: nil, fileLogLevel: nil)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        logger.debug("App will resign active")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        logger.debug("App did enter background")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        logger.debug("App will enter foreground")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        logger.debug("App did become active")
    }

    func applicationWillTerminate(application: UIApplication) {
        logger.debug("App will terminate")
    }


}

