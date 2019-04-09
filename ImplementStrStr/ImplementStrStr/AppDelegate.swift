//
//  AppDelegate.swift
//  ImplementStrStr
//
//  Created by vishnusankar on 05/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("\(self.strStr("mississippi", "issip"))")
        return true
    }
//    Steps :-
//    1. Iterate haystack string’s character
//    2. If needleCharacter is empty then return 0
//    3. Check each HayStack character with needle’s first character
    //    1. If character matched
        //    1. occurenceOfFirstIndex = hayStackCharacterIndex
        //    2. tempHayStackCharacterIndex = hayStackCharacterIndex
        //    3. lengthOfHayStackRemainingStringCount = tempHayStackCharacterIndex to hayStack.lastIndex
        //    4. If lengthOfHayStackRemainingStringCount >= needleCharacter.count
                //    1. While loop unit needle’s currentNeedleCharacterIndex is greater than needle.count
                    //    1. If hayStack[tempHayStackCharacterIndex] == needle[currentNeedleCharacterIndex]
                        //    1. tempHayStackCharacterIndex += 1
                        //    2. currentNeedleCharacterIndex += 1
                    //    2. If hayStack[tempHayStackCharacterIndex] != needle[currentNeedleCharacterIndex]
                            //    1. OccurrenceOfFirstIndex = -1
                            //    2. currentNeedleCharacterIndex = needleCharacter.count
                //    2. If currentNeedleCharacterIndex == (needleCharacter.count-1)
                    //    1. currentNeedleCharacterIndex = occurenceOfFirstIndex
        //    5. If lengthOfHayStackRemainingStringCount < needleCharacter.count
            //    1. occurenceOfFirstIndex = -1
    //    2. If character not matched
        //    1. hayStackCharacterIndex += 1

    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var hayStackCharacterIndex = 0
        var currentNeedleCharacterIndex = 0
        var occurenceOfFirstIndex = -1
        var lengthOfHayStackRemainingStringCount = 0
        
        guard needle.isEmpty == false else {
            return 0
        }
        //    3. Check each HayStack character with needle’s first character
        while hayStackCharacterIndex < haystack.count {
            if haystack[hayStackCharacterIndex] == needle.first {
                occurenceOfFirstIndex = hayStackCharacterIndex
                var tempHayStackCharacterIndex = hayStackCharacterIndex
                var isSubStringFound = false
                lengthOfHayStackRemainingStringCount = haystack.count - hayStackCharacterIndex
                if lengthOfHayStackRemainingStringCount >= needle.count {
                    while currentNeedleCharacterIndex < needle.count {
                        if haystack[tempHayStackCharacterIndex] == needle[currentNeedleCharacterIndex] {
                            tempHayStackCharacterIndex += 1
                            currentNeedleCharacterIndex += 1
                            isSubStringFound = true
                        }else {
                            occurenceOfFirstIndex = -1
                            currentNeedleCharacterIndex = needle.count
                            isSubStringFound = false
                        }
                    }
                    if isSubStringFound == false {
                        currentNeedleCharacterIndex = 0
                        hayStackCharacterIndex += 1
                    }else {
                        return occurenceOfFirstIndex
                    }
                }
                else if lengthOfHayStackRemainingStringCount < needle.count {
                    occurenceOfFirstIndex = -1
                    break
                }
            }
            else  {
                hayStackCharacterIndex += 1
            }
        }
        
        return occurenceOfFirstIndex
    }
    
    //    Steps :-
    //    1. Iterate haystack string’s character
    //    2. Check each character with needle’s first character
        //    1. If character found
            //    1. Move haystack & needle’s current character into next character
            //    2. While loop until haystack’s current character OR needle’s current character not equal to nil
                //    1. If both character is equal
                    //    1. Move haystack current character to next character
                    //    2. Move needle current character to next character
                //    2. If both character is not equal
                        //    1. Result  = -1
                        //    2. Break
            //    3. If Result == -1
                    //    1. Break
    //    3. Return Result
    func strStrOld(_ haystack: String, _ needle: String) -> Int {
        var result = -1
        var haystackCurrentIndex = 0
        var needleCurrentIndex = 0
        
        if needle.isEmpty {
            return 0
        }
        while haystackCurrentIndex < haystack.count {
            if haystack[haystackCurrentIndex] == needle[needleCurrentIndex] {
                result = haystackCurrentIndex
                haystackCurrentIndex += 1
                needleCurrentIndex += 1
                while needleCurrentIndex < needle.count {
                    if haystackCurrentIndex >= haystack.count {
                        result = -1
                        break
                    }
                    if haystack[haystackCurrentIndex] == needle[needleCurrentIndex] {
                        haystackCurrentIndex += 1
                        needleCurrentIndex += 1
                    }
                }
                
                if result == -1 || needleCurrentIndex >= needle.count {
                    break
                }
            }
            
            haystackCurrentIndex += 1
        }
        
        return result
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
