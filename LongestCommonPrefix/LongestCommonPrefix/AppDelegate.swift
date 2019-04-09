//
//  AppDelegate.swift
//  LongestCommonPrefix
//
//  Created by vishnusankar on 04/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let arrayStr = ["abc","abcc","abc","abca","abca"]
        print("\(self.longestCommonPrefix(arrayStr))")
        return true
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
//        1. Iterate elements from beginning to last element
//            1. If ResultPrefixStr == empty
//                1. Compare currentElement and nextElement common prefix
//                2. ResultPrefixStr = common Prefix which computed in previous step
//                3. currentElement =  nextElement -> nextElement
//        2. If ResultPrefixStr != empty
//            1. Compare ResultPrefixStr with currentElement of common prefix
//            2. ResultPrefixStr = common Prefix which computed in previous step
//            3. currentElement = nextElement
//        2. Return ResultPrefixStr

        var resultStr = ""
        var isFirstLoop = true
        var i = 0
        
        if strs.count == 1 {
            return strs[0]
        }
        while i < strs.count {
            let currentStr = strs[i]
            if isFirstLoop == true {
                let nextStr = strs[i+1]
                resultStr = self.commonPrefixString(str1: currentStr, str2: nextStr)
                i += 1
                isFirstLoop = false
            }else {
                resultStr = self.commonPrefixString(str1: resultStr, str2: currentStr)
            }
            i += 1
        }
        return resultStr
    }
    
    func commonPrefixString(str1:String, str2:String) -> String{
        return str1.commonPrefix(with: str2)
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

//extension String {
//    subscript (i: Int) ->
//}
