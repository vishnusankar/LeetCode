//
//  AppDelegate.swift
//  IntersectionOfTwoArrays
//
//  Created by vishnusankar on 24/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//    Steps :-        ---- O(nˆ4)
//    1. Get the smallest array of count
//    2. Remove the duplicate from the smallest array ---- O(n)
//    3. Remove the duplicate from the other array ---- O(n)
//    4. Iterate smallest array as I  ---- O(n)
//      1. Iterate other array as Y   ---- O(n)
//          1. Check smallest array[I] == otherArray[Y]
//              1. Result.append = smallestarray[I]
//              2. break
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        print("intersection - \(self.intersectionOfTwoArrays([6,6,4,4,0,0,8,1,2], [6]))")
        return true
    }

    
    
    func intersectionOfTwoArraysSecondVersion(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersectedElements = [Int]()
        //Remove duplicates
        var array1 = nums1.uniqued()
        var array2 = nums2.uniqued()
        
        let smallestArray = array1.count > array2.count ? array1 : array2
        let otherArray = array1.count > array2.count ? array2 : array1
        
        for i in 0..<smallestArray.count {
            for j in 0..<otherArray.count {
                if smallestArray[i] == otherArray[j] {
                    if intersectedElements.contains(smallestArray[i]) == false {
                        intersectedElements.append(smallestArray[i])
                    }
                    break
                }
            }
        }
        return intersectedElements
    }
    
    
//    Steps 2 :-   ---- O(nˆ2)
//    1. Get the smallest array of count
//    2. Iterate smallest array as I          ---- O(n)
//        1. Iterate other array as Y         ---- O(n)
//            1. Check smallest array[I] == otherArray[Y]
//                1. If result.contains(array[I]) == false
//                    1. Result.append = smallestarray[I]
//                2. break
    func intersectionOfTwoArrays(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        if (nums1.count < 1 || nums2.count < 1)  {
            return []
        }
        var intersectedElements = [Int]()
        //Remove duplicate values
        var array1 = nums1.uniqued()
        var array2 = nums2.uniqued()
        //Sort array
        array1 = array1.sorted()
        array2 = array2.sorted()
        
        let smallestArray = array1.count > array2.count ? array2 : array1
        var otherArray = array1.count > array2.count ? array1 : array2
        
        //Get the smallesh array
        for i in 0..<smallestArray.count {
            if self.binarySearchRecursive(startIndex: otherArray.startIndex, endIndex: otherArray.endIndex-1, array: &otherArray, targetValue: smallestArray[i]) {
                if intersectedElements.contains(smallestArray[i]) == false {
                    intersectedElements.append(smallestArray[i])
                }
            }
        }
        return intersectedElements
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

    //Steps :-
    //Variables : startIndex, endIndex, middleIndex
//            0. Base case : If (endIndex - startIndex) count < 3
//                  0.1. If endIndex value is target value
//                        0.1.1. return true
//                  0.2. If startIndex value is target value
//                       0.2.1. return true
//                  0.3 Else return false
//            1. Get middleIndex from Array
//            2. If target value is less than middleIndex value
//                1. endIndex = middleIndex
//                2. Loop back
//            3. If target value is greater than middleIndex value
//                1. startIndex = middleIndex
//                2. Loop back
//            4. If target value is equal to middleIndex value
//                1. return true
    private func binarySearchRecursive(startIndex : Int, endIndex : Int, array : inout [Int], targetValue : Int) -> Bool {
        
        let middleIndex = (startIndex + endIndex) / 2
        //Base case
        if (endIndex - startIndex) < 2 {
            if array[endIndex] == targetValue {
                return true
            }
            else if array[startIndex] == targetValue {
                return true
            }
            else {
                return false
            }
        }
        
        if array[middleIndex] < targetValue {
            return self.binarySearchRecursive(startIndex: middleIndex, endIndex: endIndex, array: &array, targetValue: targetValue)
        }
        else if array[middleIndex] > targetValue {
            return self.binarySearchRecursive(startIndex: startIndex, endIndex: middleIndex, array: &array, targetValue: targetValue)
        }
        else {
            return true
        }
    }
}

extension Array where Element : Hashable {
    func uniqued() ->  [Element] {
        var uniqueSet = Set<Element>()
        return filter { uniqueSet.insert($0).inserted}
    }
}

