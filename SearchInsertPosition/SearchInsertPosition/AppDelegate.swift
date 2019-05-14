//
//  AppDelegate.swift
//  SearchInsertPosition
//
//  Created by vishnusankar on 08/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("\(self.searchInsert([1,3,5,6], 2))")
        return true
    }
    
    func searchInsert(_ nums:[Int], _ target: Int) -> Int {
//        Steps :-
//        1. While isIndexFound != true
//            1. If input value is greater than array count
//                1. Access the last index value and check with input value
//                    1. If input value is greater than last index value
//                        1. Return array count
//                    2. If input value is lesser than last index value
//                        1. Move the currentIndex to last to previous index
//                        2. Redo the all task from before
//                    3. If input value is equal to last index value
//                        1. Return last index
//            2. If input value is lesser than array count
//                1. Go to the index of input value - 1 and fetch the value of the index.
//                    1. If input value is greater than current value
//                        1. Move the currentIndex to next index
//                        2. Redo the all task from before
//                    2. If input value is lesser than current value
//                        1. Move the currentIndex to previous index
//                        2. Redo the all task from before
//                    3. If input value is equal to current value
//                        1. Return current Index
        
        var isIndexFound = false
        var currentIndex : Int = nums.count - 1
        
        while  isIndexFound != true || (currentIndex < nums.count && currentIndex >= 0) {
            if target > nums.count {
                let lastValue = nums[currentIndex]
                    if target > lastValue {
                        isIndexFound = true
                        return nums.count
                    }
                    else if target < lastValue {
                        let tempIsIndexFound = false
                        while tempIsIndexFound != true {
                            if nums
                            currentIndex -= 1
                        }
                        
                        
                    }
                    else if target == lastValue {
                        isIndexFound = true
                        return currentIndex
                    }
                
            }
            else if target < nums.count {
                if  target > nums[target] {
                    currentIndex += 1
                    if currentIndex >= nums.count {
                        isIndexFound = true
                        return nums.count
                    }
                }
                else if target < nums[target] {
                    currentIndex -= 1
                    if currentIndex < 0 {
                        isIndexFound = true
                        currentIndex = 0
                        return currentIndex
                    }
                }
                else {
                    return currentIndex
                }
            }
        }
        
        return currentIndex
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

