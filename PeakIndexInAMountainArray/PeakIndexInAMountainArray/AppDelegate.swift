//
//  AppDelegate.swift
//  PeakIndexInAMountainArray
//
//  Created by vishnusankar on 24/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//    Steps :-
//
//    Variables : leftIndex, middleIndex, rightIndex
//
//    1. middleindex = array / 2
//    2. leftindex = middleindex - 1
//    3. rightIndex = middle index + 1
//    4. While (rightIndex < array.length)
//        1. If middleindex > rightindex
//            1. Return middleindex
//            2. Else middleindex <= rightindex
//                1. leftindex = middleindex
//                2. Middleindex = rightindex
//                3. Rightindex = rightindex + 1
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let array = [24,69,100,99,79,78,67,36,26,19]
        print("result - \(self.givePeekIndexOfArray(A: array))")
        return true
    }
    
    func givePeekIndexOfArray(A : [Int]) -> Int {
        var middleindex = 1
        var leftindex = middleindex - 1
        var rightindex = middleindex + 1
        
        while (rightindex < A.count) {
            if A[leftindex] < A[middleindex] && A[middleindex] > A[rightindex] {
                return middleindex
            }
            else if A[leftindex] < A[middleindex] && (A[middleindex] <= A[rightindex]) {
                leftindex = middleindex
                middleindex = rightindex
                rightindex = rightindex + 1
            }
            else if A[leftindex] > A[middleindex] {
                return leftindex
            }
        }
        return rightindex
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

