//
//  AppDelegate.swift
//  LengthOfTheLongestSubstringWithoutRepeatingCharacters
//
//  Created by vishnusankar on 02/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    Input: "abcabcbb"
//    Output: 3
//    Explanation: The answer is "abc", with the length of 3.
//    Example 2:
//    Input: "bbbbb"
//    Output: 1
//    Explanation: The answer is "b", with the length of 1.
//    Example 3:
//    Input: "pwwkew"
//    Output: 3


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //find substring without repeated characters
        //If new substring's length is greater than previous substring then replace old substring with new substring
        let s = "dvdf"
        self.lenghtOfLongestSubstringTwo(s)
        return true
    }

    func lenghtOfLongestSubstringTwo(_ s:String) -> Int {
        //while loop unitl startindex reach end
        //endindex should move towards right until it finds any duplicate character
        //return substring's range and if previous range is smaller than current range then update the current range
        //and move the startindex to next character
        //After startindex reach end return the current range count as result
        
        var startIndex : String.Index = s.startIndex
        var endIndex : String.Index = s.index(startIndex,offsetBy: 1)
        var subStringRange : [Range<String.Index>] = [Range<String.Index>]()
        var subStringCount : [Int] = [Int]()
        subst
        while startIndex != s.endIndex {
            print("startIndex - \(s.lastIndex(of: "f")) endIndex - \(endIndex)")
            
            let str = s[startIndex..<endIndex]
            endIndex = s.index(endIndex, offsetBy: 1)
            let nextChar = s[endIndex]
            
            if str.contains(nextChar) {
                subStringRange.append((startIndex..<endIndex))
                subStringCount.append((startIndex..<endIndex).count)
            }else {
                
            }
        }
        
        return 0
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var subStr : [String] = [String]()
        var subStringIndex = 0
        subStr.append("")
        var longestSubStrLenght = 0
        var longestSubStrIndex = -1
        
//        if s.count == 1 {
//            return 1
//        }
        for char in s {
            var subString = subStr[subStringIndex]
            if subString.contains(char) == false {
                subString.append(char)
                subStr[subStringIndex] = subString
            }
            else {
                subStringIndex += 1
                subStr.append("\(char)")
            }
            if subString.count > longestSubStrLenght {
                longestSubStrLenght = subString.count
                longestSubStrIndex = subStringIndex-1
            }

        }
        
        print("longestSubStrLenght - \(longestSubStrLenght)")
        print("data - \(subStr[longestSubStrIndex])")
        return longestSubStrLenght
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

