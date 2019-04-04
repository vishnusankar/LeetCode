//
//  AppDelegate.swift
//  RomanToInteger
//
//  Created by vishnusankar on 03/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let str = "MCM"
        print("\(self.romanToInteger(str: str))")
        return true
    }
    
    func romanToInteger(str : String) -> Int {
        var res = 0
        var i = 0
        while i < str.count {
            let char = str[i]
            let valueOne = self.value(romanCharacter: char)
            let nextPosition = i+1
            if nextPosition < str.count {
                let nextChar = str[nextPosition]
                let valueTwo = self.value(romanCharacter: nextChar)
                if  valueOne >= valueTwo {
                    res = res + valueOne
                }else {
                    res = res + (valueTwo - valueOne)
                    i += 1
                }
            }
            else {
                res = res + valueOne
            }
            
            i += 1
        }
        return res
    }
    
    func value(romanCharacter: Character) -> Int {
        switch romanCharacter {
            case "I":
                return 1
            case "V":
            return 5
            case "X":
            return 10
            case "L":
            return 50
            case "C":
            return 100
            case "D":
            return 500
            case "M":
            return 1000
        default:
            return 0
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}
