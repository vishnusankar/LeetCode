//
//  AppDelegate.swift
//  TwoSumII-InputArrayIsSorted
//
//  Created by vishnusankar on 09/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print(self.twoSum([-1,0], -1))
        return true
    }
    
//    Variables :-  currentIndex, previousIndex
//    Steps :-
//    1. Find best currentindex & previousIndex
//        1. If target > array.count
//            1. currentIndex = array.count - 1
//        2. Else If target < array.count
//            1. currentIndex = target
//        3. previousIndex = currentIndex - 1
//    2. while (array[currentIndex] + array[previousIndex]) != targetValue
//          1. If array[currentIndex]
//              1. currentIndex -= 1
//              2. previousIndex = currentIndex - 1
//          2. Else If (array[currentIndex] + array[previousIndex]) > targetValue
//            1. previousIndex -= 1
//    3. Return [previousIndex, currentIndex]

    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
     var currentIndex = 0, previousIndex = 0
        if target >= numbers.count {
            currentIndex = numbers.count - 1
        }
        else  {
            currentIndex = target
        }
        if currentIndex == 1 {
            return []
        }
        previousIndex = currentIndex - 1
        
        while numbers[currentIndex] + numbers[previousIndex] != target {
            if numbers[currentIndex] > target {
                currentIndex -= 1
                previousIndex = currentIndex - 1
            }
            else if numbers[currentIndex] + numbers[previousIndex] > target {
                previousIndex -= 1
            }
        }
        return [previousIndex+1, currentIndex+1]
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

